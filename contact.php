<?php include('partials-front/menu.php'); ?>

<html lang="en">
  <head>

    <title>ContactUs</title>
  </head>
  <style>
    body {
      background-image: linear-gradient(to right, violet, darkred, purple);
    }
  </style>

  <body>
    <center>
      <div id="ContactUs">
        <h1>Contact Us</h1>
        <form action="#>
          <div class="form-shape">
            <label for="query"> Type of Query: </label>
            <select name="myQuery" id="query">
              <option value="sel" selected>Select</option>
              <option value="ord">Order related Issues</option>
              <option value="Site">Site related Issues</option>
              <option value="fed">Complaint related Issues</option>
              <option value="others">Others</option>
            </select>
          </div>
          <br />
          <div class="form-shape">
            <label for="name">Name:</label>
            <input
              type="text"
              name="myName"
              id="name"
              placeholder="Enter your Name"
            />
          </div>
          <br />
          <div class="form-shape">
            <label for="email">Email-Id:</label>
            <input
              type="email"
              name="myEmail"
              id="email"
              placeholder="Enter your email"
            />
          </div>
          <br />
          <div class="form-shape">
            <label for="pho">Phone Number:</label>
            <input
              type="phone"
              name="myPhone"
              id="pho"
              placeholder="Enter your Phone no"
            />
          </div>
          <br />
          <div id="radio">
            Are you a member of OnlneFoodShop: Yes
            <input type="radio" name="eligible" /> No
            <input type="radio" name="eligible" />
          </div>
          <div class="form-shape">
            <label for="message"> Ellaborate your query </label>
            <textarea name="mesg" id="message" cols="50" rows="10"> </textarea>
          </div>
          <input type="submit"value="Submit" />
          <input type="reset" value="Reset" />
        </form>
      </div>
    </center>
  </body>
</html>
<?php include('partials-front/footer.php'); ?>