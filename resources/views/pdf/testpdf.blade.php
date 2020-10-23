<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta charset="utf-8">
    <!-- <meta http-equiv="Content-Type" content="text/html" charset="utf-8"> -->
    <title>Invoice Page</title>
    <link href="<?php echo public_path('/css/app.css'); ?>" rel="stylesheet">
    <link href="<?php echo public_path('/css/style.css'); ?>" rel="stylesheet">

    <style type="text/css">
	    div.page
	    {
	    	overflow: hidden;
	        page-break-after: always;
	        page-break-inside: avoid;
	    }

	    .row {
		  display: -webkit-box;
		  display: -ms-flexbox;
		  display: flex;
		  -ms-flex-wrap: wrap;
		      flex-wrap: wrap;
		  margin-right: -15px;
		  margin-left: -15px;
		}

	    .col-lg {
		    -ms-flex-preferred-size: 0;
		        flex-basis: 0;
		    -webkit-box-flex: 1;
		        -ms-flex-positive: 1;
		            flex-grow: 1;
		    max-width: 100%;
		  }

		  .col-lg-auto {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 auto;
		            flex: 0 0 auto;
		    width: auto;
		    max-width: none;
		  }

		  .col-lg-1 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 8.33333333%;
		            flex: 0 0 8.33333333%;
		    max-width: 8.33333333%;
		  }

		  .col-lg-2 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 16.66666667%;
		            flex: 0 0 16.66666667%;
		    max-width: 16.66666667%;
		  }

		  .col-lg-3 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 25%;
		            flex: 0 0 25%;
		    max-width: 25%;
		  }

		  .col-lg-4 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 33.33333333%;
		            flex: 0 0 33.33333333%;
		    max-width: 33.33333333%;
		  }

		  .col-lg-5 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 41.66666667%;
		            flex: 0 0 41.66666667%;
		    max-width: 41.66666667%;
		  }

		  .col-lg-6 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 50%;
		            flex: 0 0 50%;
		    max-width: 50%;
		  }

		  .col-lg-7 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 58.33333333%;
		            flex: 0 0 58.33333333%;
		    max-width: 58.33333333%;
		  }

		  .col-lg-8 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 66.66666667%;
		            flex: 0 0 66.66666667%;
		    max-width: 66.66666667%;
		  }

		  .col-lg-9 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 75%;
		            flex: 0 0 75%;
		    max-width: 75%;
		  }

		  .col-lg-10 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 83.33333333%;
		            flex: 0 0 83.33333333%;
		    max-width: 83.33333333%;
		  }

		  .col-lg-11 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 91.66666667%;
		            flex: 0 0 91.66666667%;
		    max-width: 91.66666667%;
		  }

		  .col-lg-12 {
		    -webkit-box-flex: 0;
		        -ms-flex: 0 0 100%;
		            flex: 0 0 100%;
		    max-width: 100%;
		  }
	</style>

	

  </head>
  <body>

    <div style="background-color: white" class="container page">
		<br>

		<h1 style="position: relative; left: 40%">{{ $user->name }}</h1>
		<h3 style="position: relative; left: 30%"class="m-l-30">{{ $otherData }}</h3>
		<hr>
		<div class="row">
			<div class="col-lg-4">
				<h1>Muaz 1</h1>
			</div>
			<div class="col-lg-4">
				<h1>Muaz 2</h1>
			</div>
			<div class="col-lg-4">
				<h1>Muaz 3</h1>
			</div>

		</div>
		<div class="row">
	        <div class="col-lg-12">
	            <div class="card">
	                <div class="card-header">
	                    <h4>My Item Item Creations</h4>
	                </div>
	                <div class="card-body">
	                    <table ref="table" id="ItemCreations" class="display responsive table table-bordered table-hover" style="width:100%">
	                        <thead>
	                            <tr>
	                                <th>Item #</th>
	                                <th>Created By</th>
	                                <th>Description</th>
	                                <th>Created At</th>
	                                <th>Status</th>
	                                <th>Action</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<tr>
	                        		<td>Item #</td>
	                                <td>Created By</td>
	                                <td>Description</td>
	                                <td>Created At</td>
	                                <td>Status</td>
	                                <td>Action</td>
	                        	</tr>
	                        	<tr>
	                        		<td>Item #</td>
	                                <td>Created By</td>
	                                <td>Description</td>
	                                <td>Created At</td>
	                                <td>Status</td>
	                                <td>Action</td>
	                        	</tr>
	                        	<tr>
	                        		<td>Item #</td>
	                                <td>Created By</td>
	                                <td>Description</td>
	                                <td>Created At</td>
	                                <td>Status</td>
	                                <td>Action</td>
	                        	</tr>
	                        	<tr>
	                        		<td>Item #</td>
	                                <td>Created By</td>
	                                <td>Description</td>
	                                <td>Created At</td>
	                                <td>Status</td>
	                                <td>Action</td>
	                        	</tr>

	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </div>

	    <hr>

      <div class="page-header">
        <h1>Bootstrap grid examples</h1>
        <p class="lead">Basic grid layouts to get you familiar with building within the Bootstrap grid system.</p>
      </div>

      <h3>Three equal columns</h3>
      <p>Get three equal-width columns <strong>starting at desktops and scaling to large desktops</strong>. On mobile devices, tablets and below, the columns will automatically stack.</p>
      <div class="row">
        <div class="col-lg-4">.col-lg-4</div>
        <div class="col-lg-4">.col-lg-4</div>
        <div class="col-lg-4">.col-lg-4</div>
      </div>

      <h3>Three unequal columns</h3>
      <p>Get three columns <strong>starting at desktops and scaling to large desktops</strong> of various widths. Remember, grid columns should add up to twelve for a single horizontal block. More than that, and columns start stacking no matter the viewport.</p>
      <div class="row">
        <div class="col-lg-3">.col-lg-3</div>
        <div class="col-lg-6">.col-lg-6</div>
        <div class="col-lg-3">.col-lg-3</div>
      </div>

      <h3>Two columns</h3>
      <p>Get two columns <strong>starting at desktops and scaling to large desktops</strong>.</p>
      <div class="row">
        <div class="col-lg-8">.col-lg-8</div>
        <div class="col-lg-4">.col-lg-4</div>
      </div>

      <h3>Full width, single column</h3>
      <p class="text-warning">No grid classes are necessary for full-width elements.</p>

      <hr>

      <h3>Two columns with two nested columns</h3>
      <p>Per the documentation, nesting is easy—just put a row of columns within an existing column. This gives you two columns <strong>starting at desktops and scaling to large desktops</strong>, with another two (equal widths) within the larger column.</p>
      <p>At mobile device sizes, tablets and down, these columns and their nested columns will stack.</p>
      <div class="row">
        <div class="col-lg-8">
          .col-lg-8
          <div class="row">
            <div class="col-lg-6">.col-lg-6</div>
            <div class="col-lg-6">.col-lg-6</div>
          </div>
        </div>
        <div class="col-lg-4">.col-lg-4</div>
      </div>

      <hr>

      <h3>Mixed: mobile and desktop</h3>
      <p>The Bootstrap 3 grid system has four tiers of classes: lg (phones), lg (tablets), lg (desktops), and lg (larger desktops). You can use nearly any combination of these classes to create more dynamic and flexible layouts.</p>
      <p>Each tier of classes scales up, meaning if you plan on setting the same widths for lg and lg, you only need to specify lg.</p>
      <div class="row">
        <div class="col-lg-12 col-lg-8">.col-lg-12 .col-lg-8</div>
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
      </div>
      <div class="row">
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
      </div>
      <div class="row">
        <div class="col-lg-6">.col-lg-6</div>
        <div class="col-lg-6">.col-lg-6</div>
      </div>

      <hr>

      <h3>Mixed: mobile, tablet, and desktop</h3>
      <p></p>
      <div class="row">
        <div class="col-lg-12 col-lg-6 col-lg-8">.col-lg-12 .col-lg-6 .col-lg-8</div>
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
      </div>
      <div class="row">
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
        <div class="col-lg-6 col-lg-4">.col-lg-6 .col-lg-4</div>
      </div>

      <hr>

      <h3>Column clearing</h3>
      <p><a href="http://getbootstrap.com/css/#grid-responsive-resets">Clear floats</a> at specific breakpoints to prevent awkward wrapping with uneven content.</p>
      <div class="row">
        <div class="col-lg-6 col-lg-3">
          .col-lg-6 .col-lg-3
          <br>
          Resize your viewport or check it out on your phone for an example.
        </div>
        <div class="col-lg-6 col-lg-3">.col-lg-6 .col-lg-3</div>

        <!-- Add the extra clearfix for only the required viewport -->
        <div class="clearfix visible-lg"></div>

        <div class="col-lg-6 col-lg-3">.col-lg-6 .col-lg-3</div>
        <div class="col-lg-6 col-lg-3">.col-lg-6 .col-lg-3</div>
      </div>

      <hr>

      <h3>Offset, push, and pull resets</h3>
      <p>Reset offsets, pushes, and pulls at specific breakpoints.</p>
      <div class="row">
        <div class="col-lg-5 col-lg-6">.col-lg-5 .col-lg-6</div>
        <div class="col-lg-5 col-lg-offset-2 col-lg-6 col-lg-offset-0">.col-lg-5 .col-lg-offset-2 .col-lg-6 .col-lg-offset-0</div>
      </div>
      <div class="row">
        <div class="col-lg-6 col-lg-5 col-lg-6">.col-lg-6 .col-lg-5 .col-lg-6</div>
        <div class="col-lg-6 col-lg-5 col-lg-offset-2 col-lg-6 col-lg-offset-0">.col-lg-6 .col-lg-5 .col-lg-offset-2 .col-lg-6 .col-lg-offset-0</div>
      </div>


    </div>

    <div class="page">
	    First page
	</div>
	<div class="page">
	    Second page
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjlgfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>


</html>