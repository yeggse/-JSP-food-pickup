const donut = document.querySelector('.donut');
donut.dataset.percent = totalMinwon;
donut.style.background = `conic-gradient(#3F8BC9 0% ${totalMinwon}%, #F2F2F2 ${totalMinwon}% 100%)`;