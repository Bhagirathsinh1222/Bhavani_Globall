<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginMaster.aspx.cs" Inherits="Bhavani_Globall.LoginMaster1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bhavani_Global | Log in</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="login-page" style="min-height: 511.6px;">
    <form runat="server">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Bhavani</b>Global</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in to start your session</p>

      <form action="../../index3.html" method="post">
          <div><p><b>Email</b></p></div>
        <div class="input-group mb-3">
          
            <asp:TextBox ID="txtEmail" class="form-control"  runat="server"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
           <div><p><b>Password</b></p></div>
        <div class="input-group mb-3">
         
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
         
              <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary btn-block"  runat="server" Text="Submit" />
          </div>
          <!-- /.col -->
        </div>
      </form>

    
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="Regstation.aspx" class="text-center">Register a new membership</a>

      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

</form>
</body>
</html>
