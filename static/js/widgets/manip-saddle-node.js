(function() {
  var slider = document.getElementById('manip-sn-slider');
  var img = document.getElementById('manip-sn-img');
  var label = document.getElementById('manip-sn-val');
  var aValues = [];
  for (var i = 0; i <= 20; i++) aValues.push((0.45 + i * 0.005).toFixed(3));

  // Detect base URL from any existing image on the page
  var existingImg = document.querySelector('.notebook-content img[src*="images/"]');
  var baseUrl = '';
  if (existingImg) {
    baseUrl = existingImg.src.replace(/images\/.*/, '');
  }

  function update() {
    var i = parseInt(slider.value);
    var pad = String(i).padStart(3, '0');
    img.src = baseUrl + 'images/part31/manip_001/frame_' + pad + '.png';
    label.textContent = aValues[i];
  }

  slider.addEventListener('input', update);
  update();
})();
