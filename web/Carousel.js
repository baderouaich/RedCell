/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
"use strict";

///========================================== Carousel slide elements data, each slide has title, description & image. ===========================================================///

 const carousel_data =
[
    {
        "title": "Que dois-je savoir ?",
        "description": "Le don de sang est un processus simple et sûr et chaque don de sang a le potentiel de sauver 3 vies.",
        "image": "./Resources/Images/Carousel/1.png"
    },
    {
        "title": "Combien de temps dure un don de sang ?",
        "description": "L'ensemble du processus prend environ une heure et 15 minutes; le don réel d'une pinte d'unité de sang total prend de huit à 10 minutes. Cependant, le temps varie légèrement avec chaque personne en fonction de plusieurs facteurs, notamment les antécédents de santé du donneur et la participation à la collecte de sang.",
        "image": "./Resources/Images/Carousel/2.png"
    },
    {
        "title": "Qui peut donner du sang ?",
        "description": "Dans la plupart des États, les donneurs doivent être âgés de 17 ans ou plus. Certains États autorisent le don par les jeunes de 16 ans avec un formulaire de consentement parental signé. Les donneurs doivent peser au moins 110 livres et être en bonne santé. Des critères d'admissibilité supplémentaires s'appliquent.",
        "image": "./Resources/Images/Carousel/3.png"
    },
    {
        "title": "Combien de temps faudra-t-il pour reconstituer la pinte de sang que je donne ?",
        "description": "Le plasma de votre don est remplacé dans un délai d'environ 24 heures. Les globules rouges ont besoin d'environ quatre à six semaines pour un remplacement complet. C'est pourquoi au moins huit semaines sont nécessaires entre les dons de sang total.",
        "image": "./Resources/Images/Carousel/4.png"
    }
];

$(document).ready(function () 
{
    console.log("RedCell Ready!");

    // Insert elements into carousel div
    carousel_data.forEach((slide) => 
    {
        // deconstruct each slide element properties
        const {title, description, image} = slide;

        // add slide element to carousel container
        $(".carousel").append(`
                            <div class="carousel-item" style="background-image: url(${image}); background-size: cover; background-position: center center; background-repeat: no-repeat; height: 100%; width: 100%;">
                             <div class="transparent-black" style="background-color: rgba(0, 0, 0, 0.5);  width: 100%; height: 680px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
                              <div class="carousel-item-title" style="width: 60%; font-size: 45px; overflow:hidden; letter-spacing: 0px; font-weight: 900; color: white; text-transform: uppercase; padding: 10px; text-align: center;">
                               ${title}
                               </div>
                               <div class="carousel-item-text" style="width: 60%; font-size: 24px; overflow:hidden; letter-spacing: 0px; font-weight: 300; color: white;  padding: 10px; text-align: center;">
                               ${description}
                               </div>
                             </div>
                           </div>
                            `);

    });

    // configure slick lib carousel https://kenwheeler.github.io/slick/#go-get-it
    $('.carousel').slick({
        initialSlide: 0, // index of the initial slide to show
        autoplay: true, //enable/disable automatique slide
        autoplaySpeed: 3000, // automatique slide each 3seconds
        dots: true, // show dots bellow carouses
        arrows: false, // show/hide left and right arrows
        infinite: true, // go back to first element on end of scroll
        speed: 1000, // scroll during 1second
        slidesToShow: 1, // show 1 slide element at the time
        slidesToScroll: 1, // scroll by  1
        centerMode: false, // shows part of next and previous slides
        mobileFirst: true, // Responsive settings use mobile first calculation
        adaptiveHeight: true // animates when slide height changes
    });

});

///======================================================================================================================///






