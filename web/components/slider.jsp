<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Website Image Slider</title>

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="slider2.css" />
  </head>

  <body>
      <div class="body-div">
          
          <section class="main swiper mySwiper">
            <div class="wrapper swiper-wrapper">
              <div class="slide swiper-slide">
                <img src="${pageContext.request.contextPath}/components/images/red-one.jpg" alt="" class="image" />
                <div class="image-data">
                  <span class="text">DWAYNE JOHNSON | CHRIS EVANS | LUCY LIU | J.K.SIMMONS</span>
                  <h2>
                    Red One (2024)
                  </h2>
                  <a href="${pageContext.request.contextPath}/components/seatBooking.jsp" class="button">Book Now</a>
                  <div><a href="#" class="trailer">Watch Trailer </a></div>
                  <div class="slider-desc-div">
                      <p class="slider-desc">When a villain kidnaps Santa Claus from the North Pole, an E.L.F. (Extremely Large and Formidable) operative joins 
                      forces with the world's most accomplished tracker to find him and save Christmas.</p>
                  </div>
                </div>
              </div>
              <div class="slide swiper-slide">
                <img src="${pageContext.request.contextPath}/components/images/venom2.jpeg" alt="" class="image" />
                <div class="image-data">
                  <span class="text">TOM HARDY | JUNO TEMPLE | PEGGY LU</span>
                  <h2>
                    Venom : The Last Dance (2024)
                  </h2>
                  <a href="#" class="button">Book Now</a>
                  <div><a href="#" class="trailer">Watch Trailer </a></div>
                  <div class="slider-desc-div">
                      <p class="slider-desc">Eddie Brock and Venom must make a devastating decision as they're pursued by a mysterious 
                          military man and alien monsters from Venom's home world.</p>
                  </div>

                </div>
              </div>
              <div class="slide swiper-slide">
                <img src="${pageContext.request.contextPath}/components/images/qp2.jpg" alt="" class="image" />
                <div class="image-data">
                  <span class="text">JOSEPH QUINN | LUPITA NYONG'O | DJIMON HOUNSOU</span>
                  <h2>
                      A Quiet Place: Day One (2024)
                  </h2>
                  <a href="#" class="button">Book Now</a>
                  <div><a href="#" class="trailer">Watch Trailer </a></div>
                  <div class="slider-desc-div">
                      <p class="slider-desc">When New York City comes under attack from an alien invasion, a woman and other survivors
                          try to find a way to safety. They soon learn that they must remain absolutely silent as the mysterious 
                          creatures are drawn to the slightest sound.</p>
                  </div>
                </div>
              </div>
            </div>

            <div class="swiper-button-next slider-nav-btn"></div>
            <div class="swiper-button-prev slider-nav-btn"></div>
            <div class="swiper-pagination"></div>
    </section>
          
      </div>
    

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
  </body>
</html>