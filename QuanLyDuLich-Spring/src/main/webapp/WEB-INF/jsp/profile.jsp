<%-- 
    Document   : profile
    Created on : Aug 12, 2021, 2:20:53 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/profile.css">

<div class="container">
<div class="row gutters">
	<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
		<div class="card h-100">
			<div class="card-body">
				<div class="account-settings">
					<div class="user-profile">
						<div class="user-avatar">
							<img src="images/avt.jpg" alt="Maxwell Admin">
						</div>
						<h5 class="user-name">Thiên Thành</h5>
						<h6 class="user-email">ctthanh2911@gmail.com</h6>
					</div>
					<div class="about">
						<h5 class="mb-2 text-primary">About</h5>
						<p>Hé lô</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
		<div class="card h-100">
			<div class="card-body">
                            <c:url value="/your-profile" var="action"/>
                            <form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<h6 class="mb-3 text-primary">Personal Details</h6>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="fullName">Full Name</label>
							<input type="text" class="form-control" id="fullName" placeholder="Enter full name">
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="eMail">Email</label>
							<input type="email" class="form-control" id="eMail" placeholder="Enter email ID">
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="phone">Phone</label>
							<input type="text" class="form-control" id="phone" placeholder="Enter phone number">
						</div>
					</div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="birth">Date Of Birth</label>
							<input type="text" class="form-control" id="birth" placeholder="Enter your birth day">
						</div>
					</div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="gender">Gender</label>
                                                            <select name="cars" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                                              <option selected>What is your gender?</option>
                                                              <option value="male">Male</option>
                                                              <option value="female">Female</option>
                                                            </select>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
                                                    <label for="avatar">Avatar</label>
                                                        <div class="form-control">
                                                            <input type="file" id="avatar" path="file" style="color: #596280" />
                                                        </div>
						</div>
					</div>
                                </div>
                                <div class="form-group">
                                    <label for="abour">About</label>
                                    <input type="text" class="form-control" id="about" placeholder="Enter">
				</div>
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<h6 class="mb-3 text-primary">Address</h6>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="Street">Street</label>
							<input type="name" class="form-control" id="Street" placeholder="Enter Street">
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
							<label for="ciTy">City</label>
							<input type="name" class="form-control" id="ciTy" placeholder="Enter City">
						</div>
					</div>
                                </div><br>
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="text-right">
							<button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
							<input value="Update" type="submit" id="submit" name="submit" class="btn btn-primary"/>
						</div>
					</div>
				</div>
                            </form>
			</div>
		</div>
	</div>
</div>
</div>
<footer style="margin-top: 8%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p style="color: var(--text-color);">
                        Copyright © 2021 TWIN TOUR
                        - Developed by <a href="#">Thành Tựu</a>
                    </p>
                </div>
            </div>
        </div>
</footer>