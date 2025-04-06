// Configuration audio initiale
var play = false;
var vid = document.getElementById("loading");
vid.volume = 0.2;
var mutetext = document.getElementById("text");
var songname = document.getElementById("songname");

// Définir la chanson fixe
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("loading").src = "song/song2.mp3";
    songname.innerHTML = "Akacia - Electric [NCS Release]";
});

// Contrôle du volume
window.addEventListener('keyup', function(e) {
    if (e.which == 38) { // Flèche HAUT
        vid.volume = Math.min(vid.volume + 0.025, 1);
    } else if (e.which == 40) { // Flèche BAS
        vid.volume = Math.max(vid.volume - 0.025, 0);
    }
});

// Fonction Mute/Unmute
var audio = document.querySelector('audio');
if (audio) {
    window.addEventListener('keydown', function(event) {
        var key = event.which || event.keyCode;
        var x = document.getElementById("text").innerText;
        var y = document.getElementById("text");

        if (key === 32 && x == "MUTE") {
            event.preventDefault();
            audio.paused ? audio.play() : audio.pause();
            y.innerHTML = "UNMUTE";
        } else if (key === 32 && x == "UNMUTE") {
            event.preventDefault();
            audio.paused ? audio.play() : audio.pause();
            y.innerHTML = "MUTE";
        }
    });
}

//SHADED-TEXT - Function for switching words in loading animation
var shadedText = document.querySelector('.shaded-text');
var texts = ["JOINING SERVER", "PREPARING ASSETS", "ESTABLISHING CONNECTION"];
var currentText = 0;

setInterval(function() {
    currentText = (currentText + 1) % texts.length;
    shadedText.classList.remove('fade-out');
    void shadedText.offsetWidth;
    shadedText.classList.add('fade-out');
    setTimeout(function() {
        shadedText.textContent = texts[currentText];
    }, 1000);
}, 4000);

//PLACEHOLDER - Function for getting handoverdata from lua script
window.addEventListener('DOMContentLoaded', () => {
    console.log(`You are connecting to ${window.nuiHandoverData.serverAddress}`);
    document.querySelector('#namePlaceholder > span').innerText = window.nuiHandoverData.name;
});

//RANDOMPHRASES - Phrases generated after your steamname
(function welcometext() {
    var welcomes = ['Begin your exciting new adventure.', 'Discover the wonders of your new city.', 'Open the door to a brand-new chapter.', 'Step into a world of new possibilities.', 'Embrace your fresh beginning.'];
    var randomWelcome = Math.floor(Math.random() * welcomes.length);
    document.getElementById('welcomeDisplay').innerHTML = welcomes[randomWelcome];
})();

// Animation du sous-titre
const subtitlePhrases = [
    "La Magie de Paris vous attend",
    "Une Aventure Parisienne",
    "Au Cœur de la Capitale",
    "Paris vous accueille"
];

let currentSubtitleIndex = 0;
const subtitle = document.querySelector('.subtitle');

function updateSubtitle() {
    subtitle.style.opacity = '0';
    setTimeout(() => {
        currentSubtitleIndex = (currentSubtitleIndex + 1) % subtitlePhrases.length;
        subtitle.textContent = subtitlePhrases[currentSubtitleIndex];
        subtitle.style.opacity = '1';
    }, 500);
}

// Initialisation et démarrage de l'animation
document.addEventListener("DOMContentLoaded", function() {
    subtitle.textContent = subtitlePhrases[0];
    setInterval(updateSubtitle, 4000);
});
  