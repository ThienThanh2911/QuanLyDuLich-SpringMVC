/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global fetch */
function addCommentBlog(userId, blogId){
    let content = document.getElementById("content").value
    if(content !== ""){
        fetch("/QuanLyDuLich-Spring/api/add-comment-blog",{
            method: 'post',
            body: JSON.stringify({
                "content": content,
                "userId": userId,
                "blogId": blogId
            }),
            headers:{
                'Content-Type': 'application/json'
            }
        }).then(function(res){
            return res.json();
        }).then(function(data){
            document.getElementById("content").value = ""
            let area = document.getElementById("commentArea")
            let userName = document.getElementById("userName").value
            let userAvatar = document.getElementById("userAvatar").value
            moment.locale('vi')
            area.innerHTML = `
            <li id="comment${data.id}">
                <div class="feature-item" style="margin-bottom:15px;">
                    <div class="left-icon user-avatar">
                        <img src="${userAvatar}" alt="First One" style="width:100px">
                    </div>
                    <div class="right-content">
                        <h4>${userName}</h4>
                        <p><em style="color: var(--text-color)">${data.comment}</em></p>
                        <p><a href="#"><i class="fa fa-thumbs-up"></i> Thích</a> | <a href="#"><i class="fa fa-comment"></i> Trả lời</a> | <a href="javascript:void(0);" onClick="removeComment(${data.id})"><i class="fa fa-remove"></i> Xóa</a>. <em class="date-comment-blog">${moment(data.created_date).fromNow()}</em></p>
                    </div>
                </div>
            </li>
            ` + area.innerHTML
        }).catch(function(err){
            console.error(err);
        });
    }else
        alert("Bạn cần phải nhập nội dung muốn bình luận!");
}
function removeCommentBlog(commentId){
    fetch(`/QuanLyDuLich-Spring/api/remove-comment-blog/${commentId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`comment${commentId}`);
        a.style.display = "none"
    }).catch(function(err){
        console.error(err);
    });
}
function setRatingBlog(rate, userId, blogId){
    if(userId !== null)
        $.post("/QuanLyDuLich-Spring/api/set-rate-blog", {rate: rate, userId: userId, blogId: blogId});
    else
        alert("Bạn cần phải đăng nhập để đánh giá về Blog này")
}