<%-- 
    Document   : package-details
    Created on : Aug 10, 2021, 1:11:08 PM
    Author     : Windows-1909
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- ***** Call to Action Start ***** -->
    <section class="section section-bg" id="call-to-action" style="background-image: url(${pageContext.request.contextPath}/images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <br>
                        <br>
                        <h2><em>${tour.price}</em></h2>
                        <p>Giá tiền của chuyến đi</p>

                        <div class="main-button">
                          <a href="#" data-toggle="modal" data-target="#exampleModal">Đặt Vé</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Call to Action End ***** -->

    <!-- ***** Fleet Starts ***** -->
    <section class="section" id="trainers">
        <div class="container">
            <br>
            <br>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img class="d-block w-100" src="images/package-image-1-1200x600.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="images/1200x600-resolution-blue-solid-color-background.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="images/package-image-1-1200x600.jpg" alt="Third slide">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
            
            <br>
            <br>

            <div class="row" id="tabs">
              <div class="col-lg-4">
                <ul>
                  <li><a href='#tabs-1'><i class="fa fa-cog"></i> Package Specs</a></li>
                  <li><a href='#tabs-2'><i class="fa fa-gift"></i> Package Description</a></li>
                  <li><a href='#tabs-3'><i class="fa fa-plus-circle"></i> Availability &amp; Prices</a></li>
                  <li><a href='#tabs-4'><i class="fa fa-info-circle"></i> Package Info</a></li>
                  <li><a href='#tabs-5'><i class="fa fa-map-marker"></i> Map</a></li>
                </ul>
              </div>
              <div class="col-lg-8">
                <section class='tabs-content' style="width: 100%;">
                  <article id='tabs-1'>
                    <h4>Package Specs</h4>

                    <div class="row">
                       <div class="col-sm-6">
                            <label style="color: var(--text-color)">Available</label>
                       
                            <p>Spring</p>
                       </div>

                       <div class="col-sm-6">
                            <label style="color: var(--text-color)">For</label>
                       
                            <p> 20 nights</p>
                       </div>

                       <div class="col-sm-6">
                            <label style="color: var(--text-color)">Flight included</label>
                       
                            <p>Yes</p>
                       </div>

                       <div class="col-sm-6">
                            <label style="color: var(--text-color)">Address</label>
                       
                            <p>${tour.destination}</p>
                       </div>
                    </div>
                  </article>
                  <article id='tabs-2'>
                    <h4>Package Description</h4>
                    
                    <p>${tour.description}</p>
                    
                   </article>
                  <article id='tabs-3'>
                    <h4>Availability &amp; Prices</h4>

                    <div class="table-responsive">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
                         <thead>
                              <tr>
                                  <th style="color: var(--text-color)">Package</th>
                                   <th style="color: var(--text-color)">From</th>
                                   <th style="color: var(--text-color)">To</th>
                                   <th style="color: var(--text-color)">Price</th>
                              </tr>
                         </thead>
                         
                         <tbody>
                             <c:forEach items="${dates}" var="date">
                              <tr>
                                   <td></td>
                                   <td style="color: #7a7a7a">${date.startDate}</td>
                                   <td style="color: #7a7a7a">${date.finishDate}</td>
                                   <td style="color: #7a7a7a">${tour.price}</td>
                              </tr>
                             </c:forEach>
                         </tbody>
                      </table>
                    </div>
                  </article>
                  <article id='tabs-4'>
                    <h4>Package Info</h4>

                    <ul class="list-group list-group-no-border">
                      <li class="list-group-item" style="margin:0 0 -1px">
                         <div class="row">
                              <div class="col-md-2 col-sm-3">
                                   <p class="pjVpProductPolicyTitle">
                                        <strong>Check-in</strong>
                                   </p>
                              </div>
                              <div class="col-md-10 col-sm-9">
                                   <p>
                                        Nội dung
                                   </p>
                              </div>
                         </div>
                      </li>

                      <li class="list-group-item" style="margin:0 0 -1px">
                           <div class="row">
                                <div class="col-md-2 col-sm-3">
                                     <p>
                                          <strong>Check-out</strong>
                                     </p>
                                </div>

                                <div class="col-md-10 col-sm-9">
                                     <p>
                                          Nội dung
                                     </p>
                                </div>
                           </div>
                      </li>

                      <li class="list-group-item" style="margin:0 0 -1px">
                           <div class="row">
                                <div class="col-md-2 col-sm-3">
                                     <p>
                                          <strong>Pets</strong>
                                     </p>
                                </div>
                                <div class="col-md-10 col-sm-9">
                                     <p>
                                          Not allowed
                                     </p>
                                </div>
                           </div>
                      </li>

                      <li class="list-group-item" style="margin:0 0 -1px">
                           <div class="row">
                                <div class="col-md-2 col-sm-3">
                                     <p>
                                          <strong>Policies</strong>
                                     </p>
                                </div>
                                <div class="col-md-10 col-sm-9">
                                     <div>
                                          <p>
                                               Nội dung 1<br>
                                               Nội dung 2<br>
                                          </p>
                                     </div>
                                </div>
                           </div>
                      </li>
                      
                      <li class="list-group-item" style="margin:0 0 -1px">
                           <div class="row">
                                <div class="col-md-2 col-sm-3">
                                     <p>
                                          <strong>Fees</strong>
                                     </p>
                                </div>

                                <div class="col-md-10 col-sm-9">
                                     <div>
                                          <p>
                                               Nội dung 1<br>
                                               Nội dung 2<br>
                                          </p>
                                     </div>
                                </div>
                           </div>
                      </li>
                    </ul>
                  </article>
                  <article id='tabs-5'>
                    <h4>Map</h4>

                    <img src="images/map.jpg" class="img-fluid" alt="">
                  </article>
                </section>
              </div>
            </div>
            <c:if test="${rate != 0}">
                <div class="rating"> 
                    <c:set value="${5}" var="a"/>
                    <c:forEach begin="1" end="5" var="i">
                        <c:if test="${rate == a}">
                            <input type="radio" name="rating" value="${a}" id="${a}" checked="true">
                        </c:if>
                        <c:if test="${rate != a}">
                            <c:if test="${rate != a}">
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <input type="radio" name="rating"  onClick="setRatingTour(${a}, ${user.id}, ${tour.id})" value="${a}" id="${a}">
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <input type="radio" name="rating"  onClick="setRatingTour(${a}, null, ${tour.id})" value="${a}" id="${a}">
                                </c:if>
                            </c:if>
                        </c:if>
                        <label for="${a}">☆</label>
                        <c:set value="${a-1}" var="a"/>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${rate == 0}">
                <div class="rating">
                    <input type="radio" name="rating" onClick="setRatingTour(5, ${user.id}, ${tour.id})" value="5" id="5">
                    <label for="5">☆</label>
                    <input type="radio" name="rating" onClick="setRatingTour(4, ${user.id}, ${tour.id})" value="4" id="4">
                    <label for="4">☆</label>
                    <input type="radio" name="rating" onClick="setRatingTour(3, ${user.id}, ${tour.id})" value="3" id="3">
                    <label for="3">☆</label>
                    <input type="radio" name="rating" onClick="setRatingTour(2, ${user.id}, ${tour.id})" value="2" id="2">
                    <label for="2">☆</label>
                    <input type="radio" name="rating" onClick="setRatingTour(1, ${user.id}, ${tour.id})" value="1" id="1">
                    <label for="1">☆</label>
                </div>
            </c:if>
                <c:set var="total" value="${0}" />
              <c:forEach var="r" items="${tour.ratetour}">
                <c:set var="total" value="${total + r.rate}" />
              </c:forEach>
              <c:if test="${total != 0}">
                  <div class="text-center" style="color: var(--text-color)">${total/tour.ratetour.size()} / ${tour.ratetour.size()} lượt đánh giá</div>
              </c:if>
            <section class='tabs-content'>
                <div class="row" style="width:1200px">
                    <div class="col-lg-6" style="width:600px">
                        <h4>Comments</h4>
                        <ul id="commentArea" class="features-items">
                            <c:forEach items="${comments}" var="comment">
                                <li id="comment${comment.id}">
                                    <div class="feature-item" style="margin-bottom:15px;">
                                        <div class="left-icon user-avatar">
                                            <img src="${comment.user.avatar}" alt="First One" style="width:100px">
                                        </div>
                                        <div class="right-content">
                                            <h4>${comment.user.username}</h4>
                                            <p><em style="color: var(--text-color)">${comment.comment}</em></p>
                                            <p><a href="#"><i class="fa fa-thumbs-up"></i> Thích</a> | <a href="#"><i class="fa fa-comment"></i> Trả lời </a><c:if test="${pageContext.request.userPrincipal.name == comment.user.username}"> | <a href="javascript:void(0);" onClick="removeComment(${comment.id})"><i class="fa fa-remove"></i> Xóa </a></c:if>. <em class="date-comment-tour">${comment.created_date}</em></p>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <script>
                        window.onload = function(){
                            let dates = document.getElementsByClassName("date-comment-tour")
                            for(let i = 0; i < dates.length; i++){
                                let d = dates[i]
                                moment.locale('vi')
                                d.innerText = moment(d.innerText).fromNow();
                            }
                        }
                    </script>
                    <div class="col-lg-6">
                        <h4>Leave a comment</h4>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <div class="contact-form">
                              <div class="row">
                                <div class="col-lg-12">
                                  <fieldset>
                                    <textarea id="content" name="content" rows="6" id="content" placeholder="Message" required=""></textarea>
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                      <input type="hidden" id="userName" value="${user.username}">
                                      <input type="hidden" id="userAvatar" value="${user.avatar}">
                                      <button type="submit" id="form-submit" onClick="addComment(${user.id}, ${tour.id})" class="main-button">Submit</button>
                                  </fieldset>
                                </div>
                              </div>
                        </div>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div>Bạn cần phải đăng nhập để bình luận về Tour này</div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>

    <!-- ***** Fleet Ends ***** -->
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Đặt Vé</h5>
            <button type="button" class="close" style="color: var(--text-color)" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="contact-us">
            <div class="contact-form">
              <form action="#" id="contact">
                  <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-10">
                                    <select name="method" class="custom-select" style="text-align-last: center; width: 75%; background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                        <option value="">Phuong thuc thanh toan</option>
                                        <option value="male">Momo</option>
                                        <option value="female">ZaloPay</option>
                                    </select>
                                </div>
                          </div>
                        </div>
                       <div class="col-md-6">
                          <div class="row">
                             <div class="col-md-6">
                                <fieldset>
                                  <input type="text" class="form-control" placeholder="From date" required="">
                                </fieldset>
                             </div>
                          </div>
                        </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <div style="color: var(--text-color)">Người lớn</div>
                            </div>
                            <div class="col-md-6">
                            <div class="input-group">
                                 <span class="input-group-btn">
                                     <button onclick="onUpdatePrice('minus', 'adult')" type="button" class="btn btn-default btn-number" data-type="minus" data-field="quant[1]">
                                         <span class="fa fa-minus"></span>
                                     </button>
                                 </span>
                                 <input id="adult" type="text" name="quant[1]" class="form-control input-number" value="1" min="1" max="30" style="margin-top: -5%; text-align: center;">
                                 <span class="input-group-btn">
                                     <button onclick="onUpdatePrice('plus', 'adult')" type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]">
                                         <span class="fa fa-plus"></span>
                                     </button>
                                 </span>
                             </div>
                            </div>
                        </div>
                     </div>
                      <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <div style="color: var(--text-color)">Trẻ em</div>
                            </div>
                            <div class="col-md-6">
                            <div class="input-group">
                                 <span class="input-group-btn">
                                     <button onmouseup="onUpdatePrice('minus', 'children')" type="button" class="btn btn-default btn-number" data-type="minus" data-field="quant[2]">
                                         <span class="fa fa-minus"></span>
                                     </button>
                                 </span>
                                 <input id="children" type="text" name="quant[2]" class="form-control input-number" value="0" min="0" max="30" style="margin-top: -5%; text-align: center;">
                                 <span class="input-group-btn">
                                     <button onmouseup="onUpdatePrice('plus', 'children')" type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[2]">
                                         <span class="fa fa-plus"></span>
                                     </button>
                                 </span>
                             </div>
                            </div>
                        </div>
                     </div>
                </div>
              </form>
           </div>
           </div>
          </div>
          <div class="modal-footer">
              <div class="inline mr-auto">
                  <input type="hidden" id="price" value="${tour.price}">
                  <span id="totalPrice" style="color: var(--text-color)"><b style="font-size: 20px">Total Price</b> - ${tour.price} VNĐ</span>
              </div>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary">Send Request</button>
          </div>
        </div>
      </div>
    </div>
    <script>
        let a = document.getElementById("adult")
        let c = document.getElementById("children")
        let t = document.getElementById("totalPrice")
        let p = document.getElementById("price").value
        function onUpdatePrice(type, test){
            let aa = 0
            if(type === "minus"){
                if(test === "adult" && a.value > 1){
                    aa = parseInt(a.value) - 1
                    t.innerHTML = '<b style="font-size: 20px">Total Price</b> - ' + (p * aa + (p * c.value)*70/100) + ' VNĐ'
                }
                if(test === "children" && c.value > 0){
                    aa = parseInt(c.value) - 1
                    t.innerHTML = '<b style="font-size: 20px">Total Price</b> - ' + (p * a.value + (p * aa)*70/100) + ' VNĐ'
                }
            }
            if(type === "plus"){
                if(test === "adult" && a.value < 30){
                    aa = parseInt(a.value) + 1
                    t.innerHTML = '<b style="font-size: 20px">Total Price</b> - ' + (p * aa + (p * c.value)*70/100) + ' VNĐ'
                }
                if(test === "children" && c.value < 30){
                    aa = parseInt(c.value) + 1
                    t.innerHTML = '<b style="font-size: 20px">Total Price</b> - ' + (p * a.value + (p * aa)*70/100) + ' VNĐ'
                }
            }
        }
        a.addEventListener('input', function( event ) {
            var value = event.target.value;
            if ( !isNaN( value ) && a.value <=30) {
              t.innerHTML = '<b style="font-size: 20px">Total Price</b> - ' + (p * value + p * c.value*70/100) + ' VNĐ'
            }
        });
        c.addEventListener('input', function( event ) {
            var value = event.target.value;
            if ( !isNaN( value ) && c.value <=30) {
              t.innerHTML = '<b style="font-size: 20px">Total Price</b> - ' + (p * a.value + p * value*70/100) + ' VNĐ'
            }
        });
    </script>