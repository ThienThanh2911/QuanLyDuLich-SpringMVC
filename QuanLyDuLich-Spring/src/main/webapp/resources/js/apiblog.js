/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function setActiveBlog(blogId){
    fetch("/QuanLyDuLich-Spring/admin/api/blogs/set-active-blog",{
        method: 'post',
        body: JSON.stringify({
            "blogId": blogId
        }),
        headers:{
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res;
    }).then(function(data){
        let b = document.getElementById(`buttonblog${blogId}`)
        let i = document.getElementById(`iblog${blogId}`)
        let icon, message
        if(i.style.color !== "green"){
            i.style.color = "green"
            b.title = "Deactive Blog"
            icon = "fa fa-check-circle"
            message = `Bạn đã kích hoạt BlogID ${blogId}`
            demo.showNotification(icon, message, 2);
        }else{
            i.style.color = "red"
            b.title = "Active Blog"
            icon = "fa fa-check-circle"
            message = `Bạn đã vô hiệu BlogID ${blogId}`
            demo.showNotification(icon, message, 4);
        }        
    }).catch(function(err){
        console.error(err);
    });
}
function removeBlog(blogId){
    fetch(`/QuanLyDuLich-Spring/admin/api/blogs/remove-blog/${blogId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`blog${blogId}`);
        a.style.display = "none"
        demo.showNotification("fa fa-trash", `Bạn đã xóa BlogID ${blogId} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}