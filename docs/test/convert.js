const CloudConvert = require('cloudconvert');
const fs = require('fs');
const https = require('https');

const cloudConvert = new CloudConvert('eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTNkNjkxOGQ0YTNjODczMGNmMjNjMzdiMWZhZjQ4N2Q1NTQ0MWEyYjM4NjQ4YWNkNzA0ODYxMTg0MTJmMWRmYjBkNzc2Yjc0OWY4MzdhOTAiLCJpYXQiOjE3MjkwOTc1MjIuODQxMjE1LCJuYmYiOjE3MjkwOTc1MjIuODQxMjE3LCJleHAiOjQ4ODQ3NzExMjIuODMxMjg5LCJzdWIiOiI2OTkwMjg2MiIsInNjb3BlcyI6WyJ0YXNrLnJlYWQiLCJ0YXNrLndyaXRlIl19.dSP_FwP5AETG5T_fwHAs8BrLN-8DJX5VnPaIwIEu_I1yy44Ze5BS8yPjLfx_DOTuRWFRGKm9cP-sfpTbmsJ4D_H9-NSGHt-j4NVUcRrslCfqPN4L8CvsasRTW2RG1_iSua7BGp4GKi49iSQngXGo4F2Qpk3n3-Sn6onUtxsQn1QuxPbyBENBa6676EiBc0thCXPrzTuaYAoMaWn4hcByfoTDAr09PuUvwsbza1PCqlR0AVIqoaB7qnet9G2DsjSTCHRwIrBkrtVFpoINIqcGLbD68j4E2Ycy0YeHRnNQxxwG2mtVQ8A6xNcZ3SQAhCTEl7PGfaeZAsHKzKYg1PbiL9z67e3Gd8OapeIE-jQGx_FvVnJGfT2B9hhHGp-V_8lQesg853O6g_guv8IEMiqwRZUhh-6GfZf2eIk6mys24VS1OL_KmobRUqyMy69pwadr25elDcn7E5LFq4HYLbQp8mbXYfJpMMbo1ypyMmIGefuw31V7SmncKIcNO73lEI2hNhH7c5qaMNgBIv_TlWXGwPZROJwzUQdyPU9MxuHYhEZB7zSBeXuD4JuqpZuzF9nYBmBQqr0JmEyACHu17G_6aQeRatM0Ber9sFJ0A8bZj229yPli5aJ8F35aI6qJI5ZYazkVuAovW3VCy9HdUIVO1Bc7ORJ-OqgF871MT5dcdEo');

async function convertTexToPdf() {
    const job = await cloudConvert.jobs.create({
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

    const uploadTask = job.tasks.filter(task => task.name === 'import-my-file')[0];
    await cloudConvert.tasks.upload(uploadTask, fs.createReadStream('./test.tex'));

    // Poll for the status of the export task
    let exportTask;
    do {
        exportTask = await cloudConvert.tasks.get(job.tasks.filter(task => task.name === 'export-my-file')[0].id);
        if (exportTask.status === 'finished') {
            break;
        }
        console.log('Waiting for the conversion to finish...');
        await new Promise(resolve => setTimeout(resolve, 5000)); // Wait 5 seconds before checking again
    } while (exportTask.status === 'processing' || exportTask.status === 'waiting');

    if (exportTask.status === 'finished' && exportTask.result && exportTask.result.files) {
        const file = exportTask.result.files[0];
        const fileUrl = file.url;

        // Download the file using the https module
        const fileStream = fs.createWriteStream('output.pdf');
        https.get(fileUrl, (response) => {
            response.pipe(fileStream);
            fileStream.on('finish', () => {
                fileStream.close();
                console.log('File converted successfully and saved as output.pdf');
            });
        }).on('error', (err) => {
            fs.unlink('output.pdf', () => {}); // Delete the file if an error occurred
            console.error('Error downloading the file:', err);
        });
    } else {
        console.error('The conversion task did not complete successfully.');
    }
}

convertTexToPdf().catch(console.error);
