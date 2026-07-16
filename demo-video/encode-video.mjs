import ffmpeg from 'ffmpeg-static';
import {spawn} from 'node:child_process';
import path from 'node:path';

const input = path.resolve('artifacts/MotorcycleSelling_Demo.webm');
const output = path.resolve('artifacts/MotorcycleSelling_Demo.mp4');
const args = ['-y', '-i', input, '-c:v', 'libx264', '-preset', 'medium', '-crf', '20', '-pix_fmt', 'yuv420p', '-movflags', '+faststart', '-an', output];
const child = spawn(ffmpeg, args, {stdio: 'inherit'});
child.on('exit', (code) => process.exit(code ?? 1));
