/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function removePayment(paymentId){
    fetch(`/QuanLyDuLich-Spring/admin/api/payments/remove-payment/${paymentId}`,{
        method: 'delete'
    }).then(function(res){
        return res;
    }).then(function(data){
        let a = document.getElementById(`payment${paymentId}`);
        a.style.display = "none"
        demo.showNotification("fa fa-trash", `Bạn đã xóa PaymentID ${paymentId} thành công`, 2);
    }).catch(function(err){
        console.error(err);
    });
}