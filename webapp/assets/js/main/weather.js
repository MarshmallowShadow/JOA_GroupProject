/*
 * 날씨 api 
 */

function showLocation(event) {
  var latitude = event.coords.latitude 
  var longitude = event.coords.longitude
  document.querySelector("#latitude").textContent = latitude
  document.querySelector("#longitude").textContent = longitude 

  
  let apiKey = "ddeb92652c34f9e77a6961c434afa555"
  let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude 
                + "&lon=" + longitude 
                + "&appid=" + apiKey; 

	let options = { method: 'GET' }
	
  ajax(weatherUrl, options).then((response) => {
		
      console.log(response)
      
      let icon = response.weather[0].icon
      let iconUrl = "http://openweathermap.org/img/wn/01d@2x.png"	/* 이미지 임시 */ 
      let img = document.querySelector("#wicon")
      img.src = iconUrl 
      
      document.querySelector("#tempr").textContent = (response.main.temp) + "(" + (response.main.temp - 273) + ")" // 현재 온도
    }).catch((error) => {
      console.log(error)
    })
}

function showError(event) {
  alert("위치 정보를 얻을 수 없습니다.")
}

window.addEventListener('load', () => { 
  if(window.navigator.geolocation) {
     window.navigator.geolocation.getCurrentPosition(showLocation,showError)
  }

})