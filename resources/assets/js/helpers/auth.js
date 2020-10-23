export function getLocalUser(){

	const userStr = localStorage.getItem("user");

	if(!userStr){
		return null;
	}

	return JSON.parse(userStr);
}

export function getLocalVendor(){

	const vendorStr = localStorage.getItem("vendor");

	if(!vendorStr){
		return null;
	}

	return JSON.parse(vendorStr);
}