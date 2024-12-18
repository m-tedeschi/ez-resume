// The Cloud Functions for Firebase SDK to create Cloud Functions and triggers.
const { logger } = require("firebase-functions");
const admin = require('firebase-admin');
const { Storage } = require('@google-cloud/storage');
const storageInstance = new Storage();
const { onRequest } = require("firebase-functions/v2/https");
const fs = require('fs');
const https = require('https');
const path = require('path');
const cloudconvert = require('cloudconvert');
// ORIG WORKED:
//const cors = require('cors')({ origin: "https://ff-debug-service-frontend-free-ygxkweukma-uc.a.run.app" });
const cors = require('cors')({
  origin: true, // Allows all origins, or you can specify an array of allowed origins
  methods: ['GET', 'POST', 'OPTIONS'], // Allow these methods
  allowedHeaders: ['Content-Type'], // Allow these headers
});

// +------------SANITIZATION FUNCTIONS ----------+
function sanitize(input) {
  // DESC: receives JSON objects and recursively iterates through the 
  //        key-value pairs, sanitizing all String values so that they do not
  //        break the LaTeX format!
  const replacements = {
    '#': '\\#',
    '$': '\\$',
    '%': '\\%',
    '&': '\\&',
    '_': '\\_',
    '{': '\\{',
    '}': '\\}',
    '~': '\\textasciitilde{}',
    '^': '\\textasciicircum{}',
    '\\': '\\textbackslash{}',
  };

  // Helper function to sanitize a single string
  function sanitizeString(str) {
    return str.replace(/[#\$%&_\{\}~^\\]/g, match => replacements[match]);
  }

  // Recursively sanitize every value in the object if it's a string
  if (typeof input === 'string') {
    return sanitizeString(input);
  }

  if (Array.isArray(input)) {
    return input.map(item => sanitize(item));  // Recurse into array elements
  }

  if (typeof input === 'object' && input !== null) {
    const sanitizedObject = {};
    for (const [key, value] of Object.entries(input)) {
      sanitizedObject[key] = sanitize(value);  // Recurse into object properties
    }
    return sanitizedObject;
  }

  // Return input if it's neither a string, array, nor object
  return input;
}

// +------------CORE TEX FUNCTIONS---------------+
const latex = require('node-latex')
// specify your API key here!
// This has been redacted for SECURITY PURPOSES
const cloudconvertApi = new cloudconvert('REDACTED! Place your own API key here'); // Replace with your API key

async function initializeResume(fName) {
  // DESC: writes the boilerplate code that is required
  //        to format the resume correctly.
  console.log("Writing boilerplate: " + fName + ".tex");
  const content = `
%-------------------------
% Resume in Latex (modified by EZ Resume team for 305Soft)
% Author : Jake Gutierrez
% Based off of: https://github.com/sb2nov/resume
% License : MIT
%------------------------
\\documentclass[letterpaper,11pt]{article}

\\usepackage{latexsym}
\\usepackage[empty]{fullpage}
\\usepackage{titlesec}
\\usepackage{marvosym}
\\usepackage[usenames,dvipsnames]{color}
\\usepackage{verbatim}
\\usepackage{enumitem}
\\usepackage[hidelinks]{hyperref}
\\usepackage{fancyhdr}
\\usepackage[english]{babel}
\\usepackage{tabularx}
\\input{glyphtounicode}


%----------FONT OPTIONS----------
% sans-serif
% \\usepackage[sfdefault]{FiraSans}
% \\usepackage[sfdefault]{roboto}
% \\usepackage[sfdefault]{noto-sans}
% \\usepackage[default]{sourcesanspro}

% serif
% \\usepackage{CormorantGaramond}
% \\usepackage{charter}

\\pagestyle{fancy}
\\fancyhf{} % clear all header and footer fields
\\fancyfoot{}
\\renewcommand{\\headrulewidth}{0pt}
\\renewcommand{\\footrulewidth}{0pt}

% Adjust margins
\\addtolength{\\oddsidemargin}{-0.5in}
\\addtolength{\\evensidemargin}{-0.5in}
\\addtolength{\\textwidth}{1in}
\\addtolength{\\topmargin}{-.5in}
\\addtolength{\\textheight}{1.0in}

\\urlstyle{same}

\\raggedbottom
\\raggedright
\\setlength{\\tabcolsep}{0in}

% Sections formatting
\\titleformat{\\section}{
  \\vspace{-4pt}\\scshape\\raggedright\\large
}{}{0em}{}[\\color{black}\\titlerule \\vspace{-5pt}]

% Ensure that generate pdf is machine readable/ATS parsable
\\pdfgentounicode=1

%-------------------------
% Custom commands
\\newcommand{\\resumeItem}[1]{
  \\item\\small{
    {#1 \\vspace{-2pt}}
  }
}

\\newcommand{\\resumeSubheading}[4]{
  \\vspace{-2pt}\\item
    \\begin{tabular*}{0.97\\textwidth}[t]{l@{\\extracolsep{\\fill}}r}
      \\textbf{#1} & #2 \\\\
      \\textit{\\small#3} & \\textit{\\small #4} \\\\
    \\end{tabular*}\\vspace{-7pt}
}

\\newcommand{\\resumeSubSubheading}[2]{
    \\item
    \\begin{tabular*}{0.97\\textwidth}{l@{\\extracolsep{\\fill}}r}
      \\textit{\\small#1} & \\textit{\\small #2} \\\\
    \\end{tabular*}\\vspace{-7pt}
}

\\newcommand{\\resumeProjectHeading}[2]{
    \\item
    \\begin{tabular*}{0.97\\textwidth}{l@{\\extracolsep{\\fill}}r}
      \\small#1 & #2 \\\\
    \\end{tabular*}\\vspace{-7pt}
}

\\newcommand{\\resumeSubItem}[1]{\\resumeItem{#1}\\vspace{-4pt}}

\\renewcommand\\labelitemii{$\\vcenter{\\hbox{\\tiny$\\bullet$}}$}

\\newcommand{\\resumeSubHeadingListStart}{\\begin{itemize}[leftmargin=0.15in, label={}]}
\\newcommand{\\resumeSubHeadingListEnd}{\\end{itemize}}
\\newcommand{\\resumeItemListStart}{\\begin{itemize}}
\\newcommand{\\resumeItemListEnd}{\\end{itemize}\\vspace{-5pt}}

%-------------------------------------------
%%%%%%  RESUME STARTS HERE  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\\begin{document}`;

  return content;
};

async function writeResumeHeader(fName, userDataJSON) {
  // DESC: queries the User Data JSON object and writes the
  //        resume's header portion.
  console.log("Appending document header: " + fName + ".tex");
  const content = `
%----------HEADING----------
\\begin{center}
    \\textbf{\\Huge \\scshape ${userDataJSON["first_name"]} ${userDataJSON["last_name"]}} \\\\ \\vspace{1pt}
    \\small ${userDataJSON["phone_number"]} $|$ \\href{mailto:${userDataJSON["email"]}}{\\underline{${userDataJSON["email"]}}} $|$
    ${userDataJSON["town"]}, ${userDataJSON["state"]} ${userDataJSON["zip_code"]}
\\end{center}`;

  return content;
}

async function writeResumeSkills(fName, skillsDataJSON) {
  // DESC: queries the first Skills document for the List<String> of user skills,
  //        then concatenates them as a String to write the Skills portion of the resume.
  console.log("Appending document skills: " + fName + ".tex");
  // ["Programming", "Dogs", "Cats"] --> "Programming, Dogs, Cats"
  var skillsString = skillsDataJSON["skill1"]["skills"].toString();

  var content = `
%-----------SKILLS-----------
\\section{Skills}
 \\begin{itemize}[leftmargin=0.15in, label={}]
    \\small{\\item{
     \\textbf{Skills}{: ${skillsString}}
    }}
 \\end{itemize}
  `;
  return content;
};

async function writeResumeExperiences(fName, expDataJSON) {
  // DESC: receives the Experience Data JSON object and loops through each
  //        Experience document. Each Experience is then written to the resume
  //        under the Experiences portion!
  console.log("Appending document experiences: " + fName + ".tex");
  var content = `
%-----------EXPERIENCE-----------
\\section{Experience}
  \\resumeSubHeadingListStart
`;
  for (let experienceKey in expDataJSON) {
    const experience = expDataJSON[experienceKey];

    const experienceContent = `
    \\resumeSubheading
      {${experience.roleTitle}}{${experience.startDate} -- ${experience.endDate}}
      {${experience.companyName}}{${experience.employmentType}}
      \\resumeItemListStart`;

    //await fs.appendFile(fName + ".tex", experienceContent);
    content = content + experienceContent;

    // Write each bullet point for the current experience
    for (let bulletPoint of experience.bulletPoints) {
      const bulletContent = `
        \\resumeItem{${bulletPoint}}`;
      //await fs.appendFile(fName + ".tex", bulletContent);
      content = content + bulletContent;
    }

    const closingBulletPoints = `
      \\resumeItemListEnd
  `;
    //await fs.appendFile(fName + ".tex", closingBulletPoints);
    content = content + closingBulletPoints;
    console.log(`Appended experience: ${experience.company}`);
  }
  const closingContent = `
  \\resumeSubHeadingListEnd
`;
  content = content + closingContent;
  return content;
};

async function writeResumeEducation(fName, schoolDataJSON) {
  // DESC: receives the School Data JSON object and loops through each Education document
  //        provided by the user. Each Education document is then written to the resume
  //        under the Education portion of the resume.
  console.log("Appending document education: " + fName + ".tex");
  console.log("Writing education section");
  var content = `
%-----------EDUCATION-----------
\\section{Education}
  \\resumeSubHeadingListStart
`;

  //await fs.appendFile(fName + ".tex", content);

  for (let schoolKey in schoolDataJSON) {
    const school = schoolDataJSON[schoolKey];
    const schoolContent = `
    \\resumeSubheading
      {${school.school}}{${school.location}}
      {${school.degree}}{${school.start} -- ${school.end}}
`;
    content = content + schoolContent;
    //await fs.appendFile(fName + ".tex", schoolContent);
    console.log(`Appended school: ${school.school}`);
  }

  const closingContent = `
  \\resumeSubHeadingListEnd
`;
  //await fs.appendFile(fName + ".tex", closingContent);
  content = content + closingContent;
  console.log("Wrote education section");
  return content;
};

async function endResume() {
  // DESC: writes the boilerplate end-of-document code for the LaTeX resume format.
  console.log("Appending end of resume");
  const content = `
%------------END DOCUMENT----------------
\\end{document}`;
  return content;
}

// +--------------------API CALL STUFF------------+ //

admin.initializeApp();

// Cloud Function to generate a random number
exports.generateRandomNumber = onRequest((req, res) => {
    // Generate a random number between 0 and 100
    const randomNumber = Math.floor(Math.random() * 101);

    // Log the random number (optional)
    logger.info(`Generated random number: ${randomNumber}`);

    // Send the random number as a response
    res.status(200).send({ number: randomNumber });
});

exports.buildResumeTex = onRequest(async (req, res) => {
  cors(req, res, async () => {
    const userDataJSON = sanitize(JSON.parse(req.body.content));
    const skillsDataJSON = sanitize(JSON.parse(req.body.skillsDataJSON));
    const expDataJSON = sanitize(JSON.parse(req.body.expDataJSON));
    const eduDataJSON = sanitize(JSON.parse(req.body.eduDataJSON));
    const fName = req.body.fName;

    const boilerplate = await initializeResume(fName);
    const header = await writeResumeHeader(fName, userDataJSON);
    const skills = await writeResumeSkills(fName, skillsDataJSON);
    const experiences = await writeResumeExperiences(fName, expDataJSON);
    const education = await writeResumeEducation(fName, eduDataJSON);
    const footer = await endResume();

    const content = boilerplate + header + skills + experiences + education + footer;

    const bucket = admin.storage().bucket('gs://ez-resume-hmpgul.appspot.com');
    const texFile = bucket.file(`ready-to-convert/${fName}.tex`);


    try {
      // Save the LaTeX file to Firebase Storage
      await texFile.save(content, { contentType: 'application/x-tex' });
      logger.info(`Successfully wrote LaTeX file to ready-to-convert/${fName}.tex`);
    } catch (error) {
      logger.error('Error writing LaTeX file:', error);
      return res.status(500).send(error.toString());
    }

    // Write LaTeX content to a temporary file for CloudConvert
    const tempTexPath = `/tmp/${fName}.tex`;
    fs.writeFileSync(tempTexPath, content);  // Save content to /tmp/

    try {
      // Create a CloudConvert job
      const job = await cloudconvertApi.jobs.create({
        tasks: {
          'import-my-file': {
            operation: 'import/upload'
          },
          'convert-my-file': {
            operation: 'convert',
            input: 'import-my-file',
            input_format: 'tex',
            output_format: 'pdf'
          },
          'export-my-file': {
            operation: 'export/url',
            input: 'convert-my-file'
          }
        }
      });
      
      // mikey's upset
      const uploadTask = job.tasks.filter(task => task.name === 'import-my-file')[0];
      const uploadUrl = uploadTask.result.form.url;
      console.log('Upload URL:', uploadUrl);
      await cloudconvertApi.tasks.upload(uploadTask, fs.createReadStream(tempTexPath));

      let exportTask;
      do {
          exportTask = await cloudconvertApi.tasks.get(job.tasks.filter(task => task.name === 'export-my-file')[0].id);
          if (exportTask.status === 'finished') {
              break;
          }
          console.log('Waiting for the conversion to finish...');
          await new Promise(resolve => setTimeout(resolve, 5000)); // Wait 5 seconds before checking again
      } while (exportTask.status === 'processing' || exportTask.status === 'waiting');
  
      if (exportTask.status === 'finished' && exportTask.result && exportTask.result.files) {
          const file = exportTask.result.files[0];
          const pdfUrl = file.url;

          const pdfResponse = await fetch(pdfUrl);
          const pdfBuffer = await pdfResponse.arrayBuffer();

          const pdfFile = bucket.file(`ready-to-convert/${fName}.pdf`);
          await pdfFile.save(Buffer.from(pdfBuffer), { contentType: 'application/pdf' });
          logger.info(`Successfully saved PDF to ready-to-convert/${fName}.pdf`);

          res.status(200).send(`LaTeX file and PDF successfully created for ${fName}`);
      } else {
          console.error('The conversion task did not complete successfully.');
      }
    } catch (error) {
      logger.error('Error during CloudConvert process:', error);
      res.status(500).send(error.toString());
    } finally {
      // Clean up temporary file
      fs.unlinkSync(tempTexPath);  // Ensure temporary file is deleted after use
    }
  });
});

exports.generateTexFile = onRequest(async (req, res) => {
  console.log('Error: deprecated function called, see exports.buildResumeTex');
});

exports.createTextFile = onRequest(async (req, res) => {
    const content = req.body.content; // Receive content from the request
    const fName = req.body.fName; // Receive file name from the request
    const bucket = storageInstance.bucket('gs://ez-resume-hmpgul.appspot.com');
    const file = bucket.file(`ready-to-convert/${fName}.txt`);

    try {
        await file.save(content); // Write the content to the file
        res.status(200).send('File created successfully');
    } catch (error) {
        res.status(500).send(error.toString());
    }
});