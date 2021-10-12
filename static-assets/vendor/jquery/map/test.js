window.onload = function() {
  
}
let stores = [];
const urlMVF ='http://14.232.243.213:8080/api/1/services/searchMarket.json';

// Example POST method implementation:
async function getISS(url = '') {
  // Default options are marked with *
  console.log('before Call')
  const response = await fetch(url, {
    method: 'GET', // *GET, POST, PUT, DELETE, etc.
  });
  return response.json(); // parses JSON response into native JavaScript objects
}

getISS(urlMVF).then(data => {
stores = data
});
var map;
var markers = [];
var infoWindow;


function initMap() {
    var losAngeles = { 
        lat: 21.036586302978087, 
        lng: 105.80739071139286
    };
    map = new google.maps.Map(document.getElementById("map"), {
      center: losAngeles,
      zoom: 11,
      mapTypeId: "roadmap",
    });
    infoWindow = new google.maps.InfoWindow();
    searchStores();
  }
  
  function searchStores() {
    var foundStores = [];
    var keyword = document.getElementById('zip-code-input').value;
    var keywordSearch = convertKeyword(keyword.toLowerCase());
    if(keyword){
      for (var store of stores){
        var address = store['address'];
        var convertAddress = convertKeyword(address.toLowerCase());
        if(convertAddress.includes(keywordSearch)){
          foundStores.push(store);
        } 
      }
    
    }else {
      foundStores = stores;
    }
    const data = Array.from(new Set(foundStores.map(JSON.stringify))).map(JSON.parse);
    clearLocations();
    displayStores(data);
    showStoresMarkers(data);
    setOnClickListener();
}

function convertKeyword(str) {
  str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a"); 
  str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e"); 
  str = str.replace(/ì|í|ị|ỉ|ĩ/g,"i"); 
  str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o"); 
  str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u"); 
  str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y"); 
  str = str.replace(/đ/g,"d");
  str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
  str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
  str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
  str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
  str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
  str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
  str = str.replace(/Đ/g, "D");
  // Some system encode vietnamese combining accent as individual utf-8 characters
  str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, ""); // ̀ ́ ̃ ̉ ̣  huyền, sắc, ngã, hỏi, nặng
  str = str.replace(/\u02C6|\u0306|\u031B/g, ""); // ˆ ̆ ̛  Â, Ê, Ă, Ơ, Ư
  // Remove extra spaces
  str = str.replace(/ + /g," ");
  str = str.trim();
  // Remove punctuations
  str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g," ");
  return str;
}

function clearLocations() {
  infoWindow.close();
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers.length = 0;
}

function setOnClickListener() {
  var storeElements = document.querySelectorAll('.store-container');
  storeElements.forEach(function(element, index){
    element.addEventListener('click', function(){
      new google.maps.event.trigger(markers[index], "click");
    })
  })
}

function displayStores(stores) {
  var storesHtml ='';
  for(var [index, store] of stores.entries()){
    var address = store['address'];
    var phone = store['phone'];
    var name = store['name'];
    storesHtml += `
            <div class="store-container">
            <div class="mb-4">
              <div class="mb-1">
                Đại lý: <strong class="text-uppercase me-3">${name}</strong>
                <i class="fas fa-map-marker-alt base-color"></i>
              </div>
              <div class="mb-1">Địa chỉ: ${address}</div>
              <div>ĐT: ${phone}</div>
            </div>
            </div>
    `
    document.querySelector('.stores-list').innerHTML = storesHtml;
    
  }
}

function showStoresMarkers(stores){
  var bounds = new google.maps.LatLngBounds();
  for(var [index, store] of stores.entries()){
    var latlng = new google.maps.LatLng(
      store["latitude"],
      store["longitude"]);
    var name = store["name"];
    var address = store["address"];
    var phone = store["phone"];
    bounds.extend(latlng);
    createMarker(latlng, name, address, phone, index+1)
  }
  map.fitBounds(bounds);
  
}

function createMarker(latlng, name, address, phone, index) {
  var html = `
      <div class="store-info-window">
        <div class="store-info-name">
          ${name}
        </div>
        <div class="store-info-address">
          <div class="circle">
            <i class="fas fa-location-arrow"></i>
          </div>
          ${address}
        </div>
        <div class="store-info-phone">
          <div class="circle">
            <i class="fas fa-phone-alt"></i>
          </div>
          ${phone}
        </div>
      </div>
  `
  var marker = new google.maps.Marker({
    map: map,
    position: latlng,
    label: index.toString(),
  });
  google.maps.event.addListener(marker, 'click', function() {
    map.setZoom(16);
    map.setCenter(marker.getPosition());
    infoWindow.setContent(html);
    infoWindow.open(map, marker);
  });
  markers.push(marker);
}