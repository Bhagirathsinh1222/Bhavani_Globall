<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regstation.aspx.cs" Inherits="Bhavani_Globall.Regstation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Registration Page</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="register-page" style="min-height: 585.6px;">
    <form runat="server">
        <div class="register-box">
            <div class="register-logo">
                <a href="../../index2.html"><b>Admin</b>LTE</a>
            </div>

            <div class="card">
                <div class="card-body register-card-body">
                    <p class="login-box-msg">Register a new membership</p>

                    <form action="../../index.html" method="post">
                        <div>
                            <label>FullName</label>
                        </div>
                        <div class="input-group mb-3">


                            <asp:TextBox ID="txtFullName" class="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div>
                            <label>Mobile</label>
                        </div>
                        <div class="input-group mb-3">

                            <asp:TextBox ID="txtMobileNO" class="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    
                                </div>
                            </div>
                        </div>
                        <div>
                            <label>Email</label>
                        </div>
                        <div class="input-group mb-3">
                            
                            <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div>
                            <label>Address</label>
                        </div>
                        <div class="input-group mb-3">
                            
                            <asp:TextBox ID="txtAddress" class="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                </div>
                            </div>
                        </div>
                        <div>
                            <label>Password</label>
                        </div>

                        <div class="input-group mb-3">
                             
                            <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <%--<div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Retype password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>--%>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                    <label for="agreeTerms">
                                        I agree to the <a href="#">terms</a>
                                    </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">

                                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary btn-block" runat="server" Text="Submit" />
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <div class="social-auth-links text-center">
                        <p>- OR -</p>
                        <a href="#" class="btn btn-block btn-primary">
                            <i class="fab fa-facebook mr-2"></i>
                            Sign up using Facebook
                        </a>
                        <a href="#" class="btn btn-block btn-danger">
                            <i class="fab fa-google-plus mr-2"></i>
                            Sign up using Google+
                        </a>
                    </div>

                    <a href="LoginMaster.aspx" class="text-center">I already have a membership</a>
                </div>
                <!-- /.form-box -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.register-box -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
    </form>
</body>
</html>
