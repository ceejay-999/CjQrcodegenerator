<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CjQrcodegenerator.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QR Code Generator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center pt-5 flex-column">
            <div class="qrtitle d-flex justify-content-center align-items-center">
                <h1>QRCode Generator</h1>
            </div>

            <div class="qrbody">
                <div class="card">
                  <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="mb-3">
                            <asp:Label ID="Label1" runat="server" Text="Enter URL" class="col-sm-2 col-form-label"></asp:Label> <span class="text-danger">*</span>
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div class="d-flex justify-content-between flex-wrap w-50">
                            <div class="mb-3">
                                <label for="exampleColorInput" class="form-label">Main Color</label> <span class="text-danger">*</span>
                                <input type="color" class="form-control form-control-color" id="exampleColorInput1" name="exampleColorInput1" value="#000000" title="Choose your color" />
                            </div>
                            <div class="mb-3">
                                <label for="exampleColorInput" class="form-label">Background Color</label> <span class="text-danger">*</span>
                                <input type="color" class="form-control form-control-color" id="exampleColorInput2" name="exampleColorInput2" value="#ffffff" title="Choose your color" />
                            </div>
                        </div>
                        <div class="mb-3">
                            <asp:Label for="File1" ID="Label2" runat="server" Text="Image Logo" class="form-label"></asp:Label>
                            <asp:FileUpload ID="File1" runat="server" class="form-control" accept="image/*" />
                        </div>

                        <asp:Button ID="Button1" runat="server" Text="Generate QrCode" class="btn btn-primary mb-3" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Download Generated QrCode" class="btn btn-success mb-3 mx-5" OnClick="Button2_Click" />
                        <div class="mt-5">
                            <div class="card">
                              <div class="card-body d-flex justify-content-center">
                                  <asp:Image ID="Image1" runat="server" />
                              </div>
                            </div>
                        </div>
                    </form>
                  </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
