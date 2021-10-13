/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function addDateDetail(tourId){
    let area = document.getElementById("dateList")
    fetch(`/QuanLyDuLich-Spring/admin/api/datedetails/add-datedetail`,{
        method: 'post',
        body: JSON.stringify({
            "startDate": document.getElementById("startDate").value,
            "finishDate": document.getElementById("finishDate").value,
            "tourId": tourId
        }),
        headers:{
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res.json();
    }).then(function(data){
        document.getElementById("startDate").value = ""
        document.getElementById("finishDate").value = ""
        area.innerHTML = area.innerHTML + `
        <tr id="datedetail${data.id}">
            <td>${moment(data.startDate).format('DD/MM/YYYY')}</td>
            <td>${moment(data.finishDate).format('DD/MM/YYYY')}</td>
            <td class="text-center">
                ${data.status}
            </td>
            <td class="text-center">
                <button onclick="removeDateDetail(${data.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                    <i class="fa fa-remove"></i>
                </button>
            </td>
        </tr>
        `
        demo.showNotification("fa fa-plus-square", `Bạn đã thêm DateDetailID ${data.id} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}
function removeDateDetail(dateId){
    fetch(`/QuanLyDuLich-Spring/admin/api/datedetails/remove-datedetail/${dateId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`datedetail${dateId}`);
        a.style.display = "none"
        demo.showNotification("fa fa-trash", `Bạn đã xóa DateDetailID ${dateId} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}
function addTag(){
    fetch(`/QuanLyDuLich-Spring/admin/api/tags/add-tag`,{
        method: 'post',
        body: JSON.stringify({
            "tagName": document.getElementById("tagName").value
        }),
        headers:{
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res.json();
    }).then(function(data){
        document.getElementById("tagName").value = ""
        var area = document.getElementById("tagList");
        var sel = document.getElementById("dropdownTag");
        var opt = document.createElement("option");
        opt.value = data.id;
        opt.text = data.name;
        sel.add(opt, null);
        $('.selectpicker').selectpicker('refresh');
        area.innerHTML = area.innerHTML + `
            <tr id="tags${data.id}">
                <td>${data.id}</td>
                <td>${data.name}</td>

                <td class="text-center">
                    <button onclick="removeTag(${data.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                        <i class="fa fa-remove"></i>
                    </button>
                </td>
            </tr>
            `
        demo.showNotification("fa fa-plus-square", `Bạn đã thêm TagID ${data.id} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}
function removeTag(tagId){
    fetch(`/QuanLyDuLich-Spring/admin/api/tags/remove-tag/${tagId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`tags${tagId}`);
        a.style.display = "none"
        demo.showNotification("fa fa-trash", `Bạn đã xóa TagID ${tagId} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}
function addCate(){
    fetch(`/QuanLyDuLich-Spring/admin/api/categories/add-category`,{
        method: 'post',
        body: JSON.stringify({
            "cateName": document.getElementById("cateName").value
        }),
        headers:{
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res.json();
    }).then(function(data){
        document.getElementById("cateName").value = ""
        var area = document.getElementById("cateList");
        var sel = document.getElementById("cate");
        var opt = document.createElement("option");
        opt.value = data.id;
        opt.text = data.name;
        sel.add(opt, null);
        $('.selectpicker').selectpicker('refresh');
        area.innerHTML = area.innerHTML + `
            <tr id="tags${data.id}">
                <td>${data.id}</td>
                <td>${data.name}</td>

                <td class="text-center">
                    <button onclick="removeCate(${data.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                        <i class="fa fa-remove"></i>
                    </button>
                </td>
            </tr>
            `
        demo.showNotification("fa fa-plus-square", `Bạn đã thêm CategoryID ${data.id} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}
function removeCate(cateId){
    fetch(`/QuanLyDuLich-Spring/admin/api/categories/remove-category/${cateId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`cates${cateId}`);
        a.style.display = "none"
        demo.showNotification("fa fa-trash", `Bạn đã xóa CategoryID ${cateId} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}