$(function(){
  $('.Nav_toggle').on('click', function () {
    $(this).toggleClass('show');

    if ($(this).hasClass('show')){
      $(this).children('.Nav').addClass('show');
    } else {
    $('.Nav').removeClass('show');
    }
  });

  // 浮き上がる演出
  function animation(){
    $('.fadeInUp').each(function(){

      var target = $(this).offset().top;

      var scroll = $(window).scrollTop();

      var windowHeight = $(window).height();

      if(scroll > target - windowHeight){
        $(this).css('opacity', '1');
        $(this).css('transform', 'translateY(0)');
      }
    });
  }
  animation();
  $(window).scroll(function (){
    animation();
  });
});

// 詳細画面
$(function(){
  $('.Nav_toggle-show').on('click', function () {
    $('.Nav_toggle-show, .Nav-show').toggleClass('show');
  });
});
 
// flash Message
$(function(){
  setTimeout("$('.notification').fadeOut('slow')", 2000) 
});


