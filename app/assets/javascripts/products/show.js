var slideIndex = 0;

function openModal(elem) {
    document.getElementById('myModal').style.display = "block";
    currentSlide(elem.getAttribute('dataId'));
}

function closeModal() {
    document.getElementById('myModal').style.display = "none";
}

function plusSlides(n) {
    slideIndex = parseInt(slideIndex) + parseInt(n);
    showSlides(slideIndex);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex-1].style.display = "block";
}