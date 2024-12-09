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
const cors = require('cors')({ origin: "https://ff-debug-service-frontend-free-ygxkweukma-uc.a.run.app" });

// +------------CORE TEX FUNCTIONS---------------+
const latex = require('node-latex')
const cloudconvertApi = new cloudconvert('eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTNkNjkxOGQ0YTNjODczMGNmMjNjMzdiMWZhZjQ4N2Q1NTQ0MWEyYjM4NjQ4YWNkNzA0ODYxMTg0MTJmMWRmYjBkNzc2Yjc0OWY4MzdhOTAiLCJpYXQiOjE3MjkwOTc1MjIuODQxMjE1LCJuYmYiOjE3MjkwOTc1MjIuODQxMjE3LCJleHAiOjQ4ODQ3NzExMjIuODMxMjg5LCJzdWIiOiI2OTkwMjg2MiIsInNjb3BlcyI6WyJ0YXNrLnJlYWQiLCJ0YXNrLndyaXRlIl19.dSP_FwP5AETG5T_fwHAs8BrLN-8DJX5VnPaIwIEu_I1yy44Ze5BS8yPjLfx_DOTuRWFRGKm9cP-sfpTbmsJ4D_H9-NSGHt-j4NVUcRrslCfqPN4L8CvsasRTW2RG1_iSua7BGp4GKi49iSQngXGo4F2Qpk3n3-Sn6onUtxsQn1QuxPbyBENBa6676EiBc0thCXPrzTuaYAoMaWn4hcByfoTDAr09PuUvwsbza1PCqlR0AVIqoaB7qnet9G2DsjSTCHRwIrBkrtVFpoINIqcGLbD68j4E2Ycy0YeHRnNQxxwG2mtVQ8A6xNcZ3SQAhCTEl7PGfaeZAsHKzKYg1PbiL9z67e3Gd8OapeIE-jQGx_FvVnJGfT2B9hhHGp-V_8lQesg853O6g_guv8IEMiqwRZUhh-6GfZf2eIk6mys24VS1OL_KmobRUqyMy69pwadr25elDcn7E5LFq4HYLbQp8mbXYfJpMMbo1ypyMmIGefuw31V7SmncKIcNO73lEI2hNhH7c5qaMNgBIv_TlWXGwPZROJwzUQdyPU9MxuHYhEZB7zSBeXuD4JuqpZuzF9nYBmBQqr0JmEyACHu17G_6aQeRatM0Ber9sFJ0A8bZj229yPli5aJ8F35aI6qJI5ZYazkVuAovW3VCy9HdUIVO1Bc7ORJ-OqgF871MT5dcdEo'); // Replace with your API key


async function initializeResume(fName) {
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
  console.log("Appending document header: " + fName + ".tex");
  const socialLink1 = "https://www.example.com";
  const socialLink2 = "https://www.uri.edu";
  const content = `
%----------HEADING----------
\\begin{center}
    \\textbf{\\Huge \\scshape ${userDataJSON["first_name"]} ${userDataJSON["last_name"]}} \\\\ \\vspace{1pt}
    \\small ${userDataJSON["phone_number"]} $|$ \\href{mailto:${userDataJSON["email"]}}{\\underline{${userDataJSON["email"]}}} $|$ 
    \\href{${socialLink1}}{\\underline{${socialLink1}}} $|$
    \\href{${socialLink2}}{\\underline{${socialLink2}}}
\\end{center}`;
  return content;
}


async function endResume() {
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
    const userDataJSON = JSON.parse(req.body.content); 
    const fName = req.body.fName;

    const boilerplate = await initializeResume(fName);
    const header = await writeResumeHeader(fName, userDataJSON);
    const footer = await endResume();

    const content = boilerplate + header + footer;

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

      // Upload the LaTeX file to CloudConvert
      /*const uploadTask = job.tasks.find(task => task.name === 'import-my-file');
      console.log('Job created:', job);
      if (!uploadTask) {
        console.error('Failed to find the import_tex task in the job:', job);
      }*/

      
      
      // mikey's pissed off
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
          // Download the file using the https module
          //const fileStream = fs.createWriteStream('output.pdf');
          //https.get(fileUrl, (response) => {
              //response.pipe(fileStream);
              //fileStream.on('finish', () => {
                  //fileStream.close();
                  //console.log('File converted successfully and saved as output.pdf');
              //});
          //}).on('error', (err) => {
              //fs.unlink('output.pdf', () => {}); // Delete the file if an error occurred
              //console.error('Error downloading the file:', err);
          //});
      } else {
          console.error('The conversion task did not complete successfully.');
      }

      /*const formData = new FormData();
      formData.append('file', fs.createReadStream(tempTexPath)); // Use /tmp/${fName}.tex
      console.log('Uploading file from path:', tempTexPath);

      const response = await fetch(uploadUrl, {
        method: 'POST',
        body: formData
      });

      const uploadResult = await response.json();
      logger.info('Uploaded LaTeX file to CloudConvert', uploadResult);

      // Wait for conversion to complete
      const exportTask = job.tasks.find(task => task.name === 'export-my-file');
      const pdfUrl = exportTask.result.files[0].url;

      // Fetch the PDF from CloudConvert
      const pdfResponse = await fetch(pdfUrl);
      const pdfBuffer = await pdfResponse.buffer();

      // Save the converted PDF to Firebase Storage
      const pdfFile = bucket.file(`ready-to-convert/${fName}.pdf`);
      await pdfFile.save(pdfBuffer, { contentType: 'application/pdf' });
      logger.info(`Successfully saved PDF to ready-to-convert/${fName}.pdf`);

      res.status(200).send(`LaTeX file and PDF successfully created for ${fName}`);
      */
    } catch (error) {
      logger.error('Error during CloudConvert process:', error);
      res.status(500).send(error.toString());
    } finally {
      // Clean up temporary file
      fs.unlinkSync(tempTexPath);  // Ensure temporary file is deleted after use
    }
  });
});


/*
exports.buildResumeTex = onRequest(async (req, res) => {
  cors(req, res, async () => {
    const userDataJSON = JSON.parse(req.body.content); // parse our JSON string into a usable object
    const fName = req.body.fName;

    const boilerplate = await initializeResume(fName); // generate boilerplate LaTeX document code
    const header = await writeResumeHeader(fName, userDataJSON); // generate header code
    const footer = await endResume(); // generate boilerplate LaTeX end-of-document code

    const content = boilerplate + header + footer; // if this works, i'm gonna be so hyped

    const bucket = storageInstance.bucket('gs://ez-resume-hmpgul.appspot.com');
    const texFile = bucket.file(`ready-to-convert/${fName}.tex`);

    try {
      await texFile.save(content, {contentType: 'application/x-tex'});
      logger.info(`Successfully wrote LaTeX file to ready-to-convert/${fName}.tex`);
    } catch (error) {
      logger.error('Error writing Latex file:', error);
      res.status(500).send(error.toString());
    }

    const tempPdfPath = `/tmp/${fName}.pdf`; // Temporary file path
    const pdf = latex(content);
    const output = fs.createWriteStream(tempPdfPath);

    pdf.pipe(output);

    pdf.on('error', err => console.error(err));

    pdf.on('finish', async () => {
      console.log('PDF generated!')

      const pdfFile = bucket.file(`ready-to-convert/${fName}.pdf`);
      await pdfFile.save(fs.readFileSync(tempPdfPath), { contentType: 'application/pdf' });
      fs.unlinkSync(tempPdfPath);
    
      res.status(200).send(`Files ${fName}.tex and ${fName}.pdf created successfully`);

    });
  });
});
*/

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
