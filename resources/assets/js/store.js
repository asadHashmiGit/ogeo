import { getLocalUser } from "./helpers/auth";
import { getLocalVendor } from "./helpers/auth";

const user = getLocalUser();
const vendor = getLocalVendor();

export default {
	state: {
		activeUserName: '',
		currentUser: user,
		userPendingTasks: {
            RejectedItemCreationsRequests: "",
			PendingItemCreationRequestsLMA: "",
			PendingItemCreationRequestsALMV: "",
            PendingVendorRFIs: "",
            PendingPurchaseEnquiries: "",
            PendingPurchaseOrders: "",
            PendingRateContractRequests: "",
            PendingStockItemRequests: "",
		},
		currentVendor: vendor,
		isLoggedIn: !!user,
		isVendorLoggedIn: !!vendor,
		loading: false,
		token: localStorage.getItem('access-token') || '',
		status: '',
	},
	getters: {
		userPendingTasks(state){
			console.log(state.userPendingTasks);
			axios.get('/api/users/get_user_pending_tasks')
                .then((response) => {
                	state.userPendingTasks.PendingItemCreationRequestsLMA = response.data.PendingItemCreationRequestsLMA;
                	state.userPendingTasks.PendingItemCreationRequestsALMV = response.data.PendingItemCreationRequestsALMV;
					state.userPendingTasks.RejectedItemCreationsRequests = response.data.RejectedItemCreationsRequests;

     				state.userPendingTasks.PendingVendorRFIs = response.data.PendingVendorRFIs;
     				state.userPendingTasks.PendingPurchaseEnquiries = response.data.PendingPurchaseEnquiries;

     				state.userPendingTasks.PendingPurchaseOrders = response.data.PendingPurchaseOrders;

     				state.userPendingTasks.PendingRateContractRequests = response.data.PendingRateContractRequests;

     				state.userPendingTasks.PendingStockItemRequests = response.data.PendingStockItemRequests;
                })
            console.log(state.userPendingTasks);
			return state.userPendingTasks;
		},
		currentUser(state){
			return state.currentUser;
		},
		currentVendor(state){
			return state.currentVendor;
		},
		isLoggedIn(state){
			return state.isLoggedIn;
		},
		isLoading(state){
			return state.loading;
		},
		isAuthenticated: state => !!state.token,
  		authStatus: state => state.status,
	},
	mutations: {
		updateUserImage(state, payload) {
			state.currentUser.Picture = payload;
			const userStr = JSON.parse(localStorage.getItem("user"))
			userStr.Picture = payload;
			localStorage.setItem('user', JSON.stringify(userStr));
		},
		updateUserStep(state, payload) {
			state.currentUser.step = payload;
			const userStr = JSON.parse(localStorage.getItem("user"))
			userStr.step = payload;
			localStorage.setItem('user', JSON.stringify(userStr));
		},

		updateLoginImage(state, payload) {
			state.currentUser.LoginImage = payload;
			const userStr = JSON.parse(localStorage.getItem("user"))
			userStr.LoginImage = payload;
			localStorage.setItem('user', JSON.stringify(userStr));
		},
		updateUserDesignation(state, payload) {
			state.currentUser.Designation = payload;
			const userStr = JSON.parse(localStorage.getItem("user"))
			userStr.Designation = payload;
			localStorage.setItem('user', JSON.stringify(userStr));
		},
		updateUserPhone(state, payload) {
			state.currentUser.Phone = payload;
			const userStr = JSON.parse(localStorage.getItem("user"))
			userStr.Phone = payload;
			localStorage.setItem('user', JSON.stringify(userStr));
		},
		updateUserAddress(state, payload) {
			state.currentUser.Address = payload;
			const userStr = JSON.parse(localStorage.getItem("user"))
			userStr.Address = payload;
			localStorage.setItem('user', JSON.stringify(userStr));
		},
		updateVendorImage(state, payload) {
			state.currentVendor.Picture = payload;
			const vendorStr = JSON.parse(localStorage.getItem("vendor"))
			vendorStr.Picture = payload;
			localStorage.setItem('vendor', JSON.stringify(vendorStr));
		},
		updateVendorLoginImage(state, payload) {
			state.currentVendor.LoginImage = payload;
			const vendorStr = JSON.parse(localStorage.getItem("vendor"))
			vendorStr.LoginImage = payload;
			localStorage.setItem('vendor', JSON.stringify(vendorStr));
		},
		updateVendorPhone(state, payload) {
			state.currentVendor.Phone = payload;
			const vendorStr = JSON.parse(localStorage.getItem("vendor"))
			vendorStr.Phone = payload;
			localStorage.setItem('vendor', JSON.stringify(vendorStr));
		},
		updateVendorAddress(state, payload) {
			state.currentVendor.Address = payload;
			const vendorStr = JSON.parse(localStorage.getItem("vendor"))
			vendorStr.Address = payload;
			localStorage.setItem('vendor', JSON.stringify(vendorStr));
		},
		login(state) {
			state.loading = true;
			state.isLoggedIn = true;
		},
		vendor_login(state) {
			state.loading = true;
			state.isVendorLoggedIn = true;
		},
		logout(state) {
		
			axios.get('/api/users/client_logout')
                .then((response) => {
                	console.log(response.data)
     				state.loading = false;
					state.currentUser = false;
					state.token = '';
			     	localStorage.removeItem('user');
			     	localStorage.removeItem('access-token');
			     	delete axios.defaults.headers.common['Authorization'];
			     	delete $.ajaxSettings.headers["Authorization"];

                })
                .catch((error) => {
                	state.loading = false;
                    console.log('Logout Error');
                    console.log(error.response);
                });
            
		},
		vendor_logout(state) {
		
			axios.get('/vendors/logout')
                .then((response) => {
                	state.loading = false;
					state.currentUser = false;
     				localStorage.removeItem('vendor');     				
     				location.reload();
                })
                .catch((error) => {
                	state.loading = false;
                    console.log('Logout Error');
                    console.log(error.response);
                });
            
		},
		setUser(state, payload) {
			state.currentUser = payload;
			localStorage.setItem('user', JSON.stringify(payload));
			console.log('User is set in the localStorage');
		},
		setVendor(state, payload) {
			state.currentVendor = payload;
			localStorage.setItem('vendor', JSON.stringify(payload));
		},
		update_user_pending_tasks(state) {
			console.log('executing get_user_pending_tasks');
			axios.get('/api/users/get_user_pending_tasks')
                .then((response) => {
                	state.userPendingTasks.PendingItemCreationRequestsALMV = response.data.PendingItemCreationRequestsALMV;
                	state.userPendingTasks.PendingItemCreationRequestsLMA = response.data.PendingItemCreationRequestsLMA;
					state.userPendingTasks.RejectedItemCreationsRequests = response.data.RejectedItemCreationsRequests;

     				state.userPendingTasks.PendingVendorRFIs = response.data.PendingVendorRFIs;
     				state.userPendingTasks.PendingPurchaseEnquiries = response.data.PendingPurchaseEnquiries;

     				state.userPendingTasks.PendingPurchaseOrders = response.data.PendingPurchaseOrders;

     				state.userPendingTasks.PendingRateContractRequests = response.data.PendingRateContractRequests;

     				state.userPendingTasks.PendingStockItemRequests = response.data.PendingStockItemRequests;
                })
		},
		POST_AUTH_REQUEST: (state) => {
		    state.status = 'loading'
		},
		AUTH_SUCCESS: (state, token) => {
		    state.status = 'success'
		    state.token = token
		},
		AUTH_ERROR: (state) => {
		    state.status = 'error'
		},
		POST_AUTH_LOGOUT: (state) => {
			state.loading = false;
			state.currentUser = false;
			state.currentVendor = false;
		    state.token = ''
		    localStorage.removeItem('access-token');
		    localStorage.removeItem('user');
		    localStorage.removeItem('vendor');
		    // Also Can Make Request to backend to Revoke Token
		}
	},
	actions: {
		POST_AUTH_REQUEST: ({commit, dispatch}, user) => {
	        return new Promise((resolve, reject) => {
	            commit('POST_AUTH_REQUEST')
	            axios({url: '/api/client_login', data: user, method: 'POST' })
	            .then(resp => {
	            	// console.log(resp.data);
	                const token = resp.data.token
	                localStorage.setItem('access-token', token)
					commit('setUser', resp.data.UserDetails);
				
	                // Add the following line:
	                axios.defaults.headers.common['Authorization'] = 'Bearer '+token
	                $.ajaxSetup({ headers: { 'Authorization': 'Bearer '+token } });
	                commit('AUTH_SUCCESS', token)
	                resolve(resp)
	            })
	            .catch(err => {
	                commit('AUTH_ERROR', err)
	                localStorage.removeItem('access-token')
	                reject(err)
	            })
	        })
	    },

	    POST_AUTH_REQUEST_VENDOR: ({commit, dispatch}, user) => {
	        return new Promise((resolve, reject) => {
	            commit('POST_AUTH_REQUEST')
	            axios({url: '/api/vendor_login', data: user, method: 'POST' })
	            .then(resp => {
	            	// console.log(resp.data);
	                const token = resp.data.token
	                localStorage.setItem('access-token', token)
	                commit('setVendor', resp.data.VendorDetails);
	                // Add the following line:
	                axios.defaults.headers.common['Authorization'] = 'Bearer '+token
	                $.ajaxSetup({ headers: { 'Authorization': 'Bearer '+token } });
	                commit('AUTH_SUCCESS', token)
	                resolve(resp)
	            })
	            .catch(err => {
	                commit('AUTH_ERROR', err)
	                localStorage.removeItem('access-token')
	                reject(err)
	            })
	        })
	    },
	    POST_AUTH_REQUEST_REGISTER: ({commit, dispatch}, user) => {
	        return new Promise((resolve, reject) => {
				console.log(user);
	            commit('POST_AUTH_REQUEST')
	            axios({url: '/api/register', data: user, method: 'POST' })
	            .then(resp => {
	            	// console.log(resp.data);
	                const token = resp.data.token
	                localStorage.setItem('access-token', token)
	                commit('setUser', resp.data.UserDetails);
	                // Add the following line:
	                axios.defaults.headers.common['Authorization'] = 'Bearer '+token
	                $.ajaxSetup({ headers: { 'Authorization': 'Bearer '+token } });
	                commit('AUTH_SUCCESS', token)
	                resolve(resp)
	            })
	            .catch(err => {
	                commit('AUTH_ERROR', err)
	                localStorage.removeItem('access-token')
	                reject(err)
	            })
	        })
	    },

		login(context){
			context.commit("login");
		},
		vendor_login(context){
			context.commit("vendor_login");
		},
		logout({commit, dispatch}){
			//context.commit("logout");
			return new Promise((resolve, reject) => {
				axios.get('/api/users/client_logout')
	                .then((response) => {
	                	// console.log(response.data)
	                	commit('POST_AUTH_LOGOUT')
				     	delete axios.defaults.headers.common['Authorization'];
				     	delete $.ajaxSettings.headers["Authorization"];
				     	resolve()
	                })
	                .catch((error) => {
	                	commit('AUTH_ERROR')
	                    // console.log('Logout Error');
	                    console.log(error.response);
	                    reject(error)
	                });
	        })

		},
		vendor_logout({commit, dispatch}){
			// context.commit("vendor_logout");
			return new Promise((resolve, reject) => {
				axios.get('/api/vendors/vendor_logout')
	                .then((response) => {
	                	// console.log(response.data)
	                	commit('POST_AUTH_LOGOUT')
				     	delete axios.defaults.headers.common['Authorization'];
				     	delete $.ajaxSettings.headers["Authorization"];
				     	resolve()
	                })
	                .catch((error) => {
	                	commit('AUTH_ERROR')
	                    // console.log('Logout Error');
	                    // console.log(error.response);
	                    reject(error)
	                });
	        })
		},
		update_user_pending_tasks(context){
			console.log('dispatching get_user_pending_tasks');
			context.commit("update_user_pending_tasks");
		}
	}
}