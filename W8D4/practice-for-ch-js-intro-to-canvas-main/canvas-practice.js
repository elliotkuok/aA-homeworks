document.addEventListener("DOMContentLoaded", function() {
  // Your code here
  const canvas = document.getElementById("myCanvas");
  myCanvas.width = 500; 
  myCanvas.height = 500;
  const ctx = canvas.getContext("2d");

  ctx.fillStyle = 'red';
  ctx.fillRect(130, 190, 40, 60);

  
  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.moveTo(110, 75);
  ctx.arc(75, 75, 35, 0, Math.PI, false); // Mouth (clockwise)
  ctx.moveTo(65, 65);
  ctx.arc(60, 65, 5, 0, Math.PI * 2, true); // Left eye
  ctx.moveTo(95, 65);
  ctx.arc(90, 65, 5, 0, Math.PI * 2, true); // Right eye
  // ctx.strokeStyle = 'green';
  // ctx.lineWidth = 15;
  ctx.stroke();
  // ctx.fillStyle = 'yellow';
  // ctx.fill();
});