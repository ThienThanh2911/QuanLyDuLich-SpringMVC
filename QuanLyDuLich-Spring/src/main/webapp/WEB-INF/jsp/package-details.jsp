<%-- 
    Document   : package-details
    Created on : Aug 10, 2021, 1:11:08 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- ***** Call to Action Start ***** -->
    <section class="section section-bg" id="call-to-action" style="background-image: url(images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <br>
                        <br>
                        <h2><em>${tour.price}</em></h2>
                        <p>Giá tiền của chuyến đi</p>

                        <div class="main-button">
                          <a href="#" data-toggle="modal" data-target="#exampleModal">Enquiry</a>
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
                              <tr>
                                   <td></td>
                                   <td style="color: #7a7a7a">${tour.startDate}</td>
                                   <td style="color: #7a7a7a">${tour.finishDate}</td>
                                   <td style="color: #7a7a7a">${tour.price}</td>
                              </tr>
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
        </div>
    </section>
    <!-- ***** Fleet Ends ***** -->
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Enquiry</h5>
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
                          <fieldset>
                            <input type="text" class="form-control" placeholder="Enter full name" required="">
                          </fieldset>
                       </div>

                       <div class="col-md-6">
                          <fieldset>
                            <input type="text" class="form-control" placeholder="Enter email address" required="">
                          </fieldset>
                       </div>
                  </div>

                  <div class="row">
                       <div class="col-md-6">
                          <fieldset>
                            <input type="text" class="form-control" placeholder="Enter phone" required="">
                          </fieldset>
                       </div>

                       <div class="col-md-6">
                          <div class="row">
                             <div class="col-md-6">
                                <fieldset>
                                  <input type="text" class="form-control" placeholder="From date" required="">
                                </fieldset>
                             </div>

                             <div class="col-md-6">
                                <fieldset>
                                  <input type="text" class="form-control" placeholder="To date" required="">
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
                                     <button type="button" class="btn btn-default btn-number" data-type="minus" data-field="quant[1]">
                                         <span class="fa fa-minus"></span>
                                     </button>
                                 </span>
                                 <input type="text" name="quant[1]" class="form-control input-number" value="1" min="1" max="30" style="margin-top: -5%; text-align: center;">
                                 <span class="input-group-btn">
                                     <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]">
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
                                     <button type="button" class="btn btn-default btn-number" data-type="minus" data-field="quant[2]">
                                         <span class="fa fa-minus"></span>
                                     </button>
                                 </span>
                                 <input type="text" name="quant[2]" class="form-control input-number" value="1" min="1" max="30" style="margin-top: -5%; text-align: center;">
                                 <span class="input-group-btn">
                                     <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[2]">
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
                  <span style="color: var(--text-color)"><b style="font-size: 20px">Total Price</b> - 1.000.000 VND</span>
              </div>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary">Send Request</button>
          </div>
        </div>
      </div>
    </div>