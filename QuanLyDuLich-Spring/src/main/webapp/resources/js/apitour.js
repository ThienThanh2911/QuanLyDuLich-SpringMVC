/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function setActiveTour(tourId){
    fetch("/QuanLyDuLich-Spring/admin/api/packages/set-active-tour",{
        method: 'post',
        body: JSON.stringify({
            "tourId": tourId
        }),
        headers:{
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res;
    }).then(function(data){
        let b = document.getElementById(`buttontour${tourId}`)
        let i = document.getElementById(`itour${tourId}`)
        let icon, message
        if(i.style.color !== "green"){
            i.style.color = "green"
            b.title = "Deactive Tour"
            icon = "fa fa-check-circle"
            message = `Bạn đã kích hoạt TourID ${tourId}`
            demo.showNotification(icon, message, 2);
        }else{
            i.style.color = "red"
            b.title = "Active Tour"
            icon = "fa fa-check-circle"
            message = `Bạn đã vô hiệu TourID ${tourId}`
            demo.showNotification(icon, message, 4);
        }              
    }).catch(function(err){
        console.error(err);
    });
}
function removeTour(tourId){
    fetch(`/QuanLyDuLich-Spring/admin/api/packages/remove-tour/${tourId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`tour${tourId}`);
        a.style.display = "none"
        demo.showNotification("fa fa-trash", `Bạn đã xóa TourID ${tourId} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}