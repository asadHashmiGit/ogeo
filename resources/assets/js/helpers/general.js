import { getLocalUser } from "./auth";
import { getLocalVendor } from "./auth";
	
let currentUser = null;
let currentVendor = null;

export function initialize(store, router){


	router.beforeEach((to, from, next) => {


		currentUser = getLocalUser();
		currentVendor = getLocalVendor();

		const requiresAuth = to.matched.some(record => record.meta.requiresAuth);
    	const vendorRoute = to.matched.some(record => record.meta.vendorRoute);

    	// console.log(currentUser, currentVendor, 'requiresAuth: '+requiresAuth, 'vendorRoute: '+vendorRoute);

    	//Check if the link provided is available in router otherwise redirect to page not found 404

		//get user details once logging in is completed by laravel (Using Cookie Auth)
		if(!requiresAuth){ // No Authentication Required for this route

			console.log('Des Not Required Auth Routes');
    		console.log(from.path);
        	console.log(to.path);

        	//Prevent the user to access home screen or any other non existing routes if he is logged in and redirect back to profile page
        	if(currentUser){
        		next({ path: '/app/profile' });
        		return
        	} else if(currentVendor){
        		next({ path: '/app/vendors/profile' });
        		return
        	} else {
				next();
				return
        	}


		} else { // Authentication IS Required for this route
			if(!vendorRoute){ // We are at User Routes

				console.log('Required Auth User Routes');
	    		console.log(from.path);
	        	console.log(to.path);

				if(currentUser){ // We are logged in
					console.log('User Is Logged In');

					if(currentUser.CompanyId == null && to.path == '/app/account_settings'){
						console.log("user Done");
						next();
						return
					}

					if(currentUser.CompanyId == null){
						console.log('User Missing Setup Redirect to Account Settings');
						next({ path: '/app/account_settings' })
						return
					} else {
						console.log('User Have Company and Will Be Directed to the Requested Page');
						next();
						return
					}
				} else {
					next({ path: '/client_login' });
					return
				}
				

			} else { // We are at Vendor Routes

				console.log('Required Auth Vendor Routes');
	    		console.log(from.path);
	        	console.log(to.path);
	        	

				if(currentVendor){ // We are logged in
					next();
					return
				} else {
					next({ path: '/vendor_login' });
					return
				}
				

			}
		}
    	

		
	});


	axios.interceptors.request.use(function(config) {
	  	// Do something before request is sent
	  	$(document.body).css({'cursor' : 'wait'});
	  	return config;

	}, function(error) {
	  	// Do something with request error
	  	console.log('Error');
	  	return Promise.reject(error);
	});

	

	axios.interceptors.response.use((response) => {
		$(document.body).css({'cursor' : 'default'});
		return response;
	}, (error) => {

		currentUser = getLocalUser();
		currentVendor = getLocalVendor();

		if(currentUser){
			if(error.response.status == 401){
				store.dispatch('logout');
				router.push('/client_login');
			}
		}

		if(currentVendor){
			if(error.response.status == 401){
				store.dispatch('vendor_logout');
				router.push('/vendor_login');
			}
		}

		return Promise.reject(error);
	});
	
}