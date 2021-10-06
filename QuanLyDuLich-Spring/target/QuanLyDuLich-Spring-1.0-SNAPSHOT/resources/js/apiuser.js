/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function setActiveUser(userId){
    fetch("/QuanLyDuLich-Spring/admin/api/users/set-active-user",{
        method: 'post',
        body: JSON.stringify({
            "userId": userId
        }),
        headers:{
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res;
    }).then(function(data){
        let b = document.getElementById(`buttonuser${userId}`)
        let i = document.getElementById(`iuser${userId}`)
        let icon, message
        if(i.style.color !== "green"){
            i.style.color = "green"
            b.title = "Deactive Blog"
            icon = "fa fa-check-circle"
            message = `Bạn đã kích hoạt UserID ${userId}`
            demo.showNotification(icon, message, 2);
        }else{
            i.style.color = "red"
            b.title = "Active Blog"
            icon = "fa fa-check-circle"
            message = `Bạn đã vô hiệu UserID ${userId}`
            demo.showNotification(icon, message, 4);
        }        
    }).catch(function(err){
        console.error(err);
    });
}
function removeUser(userId){
    fetch(`/QuanLyDuLich-Spring/admin/api/users/remove-user/${userId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`user${userId}`);
        a.style.display = "none"
        demo.showNotification("fa fa-trash", `Bạn đã xóa UserID ${userId} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}