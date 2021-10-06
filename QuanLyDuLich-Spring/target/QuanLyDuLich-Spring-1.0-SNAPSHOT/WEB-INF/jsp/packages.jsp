<%-- 
    Document   : packages
    Created on : Aug 10, 2021, 12:12:08 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- ***** Call to Action Start ***** -->
    <section class="section section-bg" id="call-to-action" style="background-image: url(images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <br>
                        <br>
                        <h2>Our <em>Packages</em></h2>
                        <p>Danh sách các Tours sắp diễn ra và hiện vẫn còn cho phép đặt vé</p>
                        <p>${counter}</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Call to Action End ***** -->
    
    <div class="s007">
        <c:url value="/packages" var="action"/>
        <form method="post" action="${action}" enctype="multipart/form-data" >
        <div class="inner-form">
          <div class="basic-search">
            <div class="input-field">
              <div class="icon-wrap">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20">
                  <path d="M18.869 19.162l-5.943-6.484c1.339-1.401 2.075-3.233 2.075-5.178 0-2.003-0.78-3.887-2.197-5.303s-3.3-2.197-5.303-2.197-3.887 0.78-5.303 2.197-2.197 3.3-2.197 5.303 0.78 3.887 2.197 5.303 3.3 2.197 5.303 2.197c1.726 0 3.362-0.579 4.688-1.645l5.943 6.483c0.099 0.108 0.233 0.162 0.369 0.162 0.121 0 0.242-0.043 0.338-0.131 0.204-0.187 0.217-0.503 0.031-0.706zM1 7.5c0-3.584 2.916-6.5 6.5-6.5s6.5 2.916 6.5 6.5-2.916 6.5-6.5 6.5-6.5-2.916-6.5-6.5z"></path>
                </svg>
              </div>
                <input id="search" type="text" name="kw" placeholder="Search..." />
              <div class="result-count">
                <span>${count} </span>results</div>
            </div>
          </div>
          <div class="advance-search">
            <span class="desc">Advanced Search</span>
            <div class="row">
                <div class="input-field">
                  <div class="input-select">
                    <select name="cate" class="form-control">
                        <option placeholder="" value="">CATEGORY</option>
                        <c:forEach items="${categories}" var="cat">
                            <option value="${cat.id}">${cat.name}</option>
                        </c:forEach>
                    </select>
                  </div>
                </div>
              <div class="input-field">
                  <input name="priceMin" type="number" placeholder="MIN - 0" class="input-price" min="0" />
              </div>
            </div>
            <div class="row second">
              <div class="input-field">
                  <input name="date" type="date" placeholder="DATE - dd/mm/yy" class="input-price" />
              </div>
                <div class="input-field">
                    <input name="priceMax" type="number" placeholder="MAX - 100.000.000" max="100000000" min="0" class="input-price" />
                </div>
            </div>
            <div class="row third">
              <div class="input-field">
                <button class="btn-search">Search</button>
                <button class="btn-delete" id="delete">Delete</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
    <script src="resources/js/choices.js"></script>
    <script>
      const customSelects = document.querySelectorAll("select");
      const deleteBtn = document.getElementById('delete')
      const choices = new Choices('select',
      {
        searchEnabled: false,
        removeItemButton: true,
        itemSelectText: '',
      });
      for (let i = 0; i < customSelects.length; i++)
      {
        customSelects[i].addEventListener('addItem', function(event)
        {
          if (event.detail.value)
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('valid')
            parent.classList.remove('invalid')
          }
          else
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('invalid')
            parent.classList.remove('valid')
          }
        }, false);
      }
      deleteBtn.addEventListener("click", function(e)
      {
        e.preventDefault()
        const deleteAll = document.querySelectorAll('.choices__button')
        for (let i = 0; i < deleteAll.length; i++)
        {
          deleteAll[i].click();
        }
      });
    </script>

    <!-- ***** Fleet Starts ***** -->
    <section class="section" id="trainers">
        <div class="container">
            <h3 class="headline">
                <span>Tour mới nhất</span>
            </h3>
            <h3 class="headline">
                <a href="#" class="clearfix-headline">
                    <span>Tour Miền Nam</span>
                    <em class="readmore hidden-xs">Xem tất cả ></em>
                </a>
            </h3>
            <div class="row">
                <c:forEach var="t" items="${tours}">
                <div class="col-lg-4">
                    <div class="trainer-item">
                        <div class="image-thumb">
                            <img src="<c:url value="${t.photos}" />" alt="${t.name}">
                        </div>
                        <div class="down-content">
                            <div>
                                <span>${t.price}<sup>đ</sup></span>
                                
                                <span style="float:right">Lượt xem: 100</span>
                            </div>
                            <h4>${t.name}</h4>
                                
                            <p>
                                <i class="fa fa-cube"></i> 20 nights &nbsp;&nbsp;&nbsp;

                                <i class="fa fa-plane"></i> ${t.vehicle.toString()} &nbsp;&nbsp;&nbsp;
                                <c:set var="total" value="${0}" />
                                <c:forEach var="r" items="${t.ratetour}">
                                  <c:set var="total" value="${total + r.rate}" />
                                </c:forEach>
                                <c:if test="${total != 0}">
                                    <i class="fa fa-star"></i> ${total/t.ratetour.size()} &nbsp;&nbsp;&nbsp;
                                </c:if>
                                <c:forEach var="tag" items="${t.tags}">
                                    <div class="badge badge-pill badge-secondary" style="color:white; margin-right: 5px;">${tag.name}</div>
                                </c:forEach>
                            </p>

                            <ul class="social-icons">
                                <li><a href="package-details/${t.id}">+ View Package</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>

            <br>
                
            <nav>
              <ul class="pagination pagination-lg justify-content-center">
                <%--<li class="page-item">
                        <a class="page-link" href="<c:url value="/packages" />?page=${pageLink}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                  </a>
                </li>--%>
                    <c:forEach begin="1" end="${countPage}" var="i">
                        <li class="page-item"><a class="page-link" href="<c:url value="/packages" />?page=${i}">${i}</a></li>
                    </c:forEach>
                <%--<li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>--%>
              </ul>
            </nav>

        </div>
    </section>
    <!-- ***** Fleet Ends ***** -->