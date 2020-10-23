<?php

namespace App\Policies;

use App\User;
use App\QuotationRequest;
use Illuminate\Auth\Access\HandlesAuthorization;

class QuotationRequestPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the quotation request.
     *
     * @param  \App\User  $user
     * @param  \App\QuotationRequest  $quotationRequest
     * @return mixed
     */
    public function view(User $user, QuotationRequest $quotationRequest)
    {
        if($user->company_id == $quotationRequest->company_id && $user->hasRole('RFQM')){
            return true;
        }

        return false;
        
    }

    /**
     * Determine whether the user can create quotation requests.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the quotation request.
     *
     * @param  \App\User  $user
     * @param  \App\QuotationRequest  $quotationRequest
     * @return mixed
     */
    public function update(User $user, QuotationRequest $quotationRequest)
    {
        //
    }

    /**
     * Determine whether the user can delete the quotation request.
     *
     * @param  \App\User  $user
     * @param  \App\QuotationRequest  $quotationRequest
     * @return mixed
     */
    public function delete(User $user, QuotationRequest $quotationRequest)
    {
        //
    }

    /**
     * Determine whether the user can restore the quotation request.
     *
     * @param  \App\User  $user
     * @param  \App\QuotationRequest  $quotationRequest
     * @return mixed
     */
    public function restore(User $user, QuotationRequest $quotationRequest)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the quotation request.
     *
     * @param  \App\User  $user
     * @param  \App\QuotationRequest  $quotationRequest
     * @return mixed
     */
    public function forceDelete(User $user, QuotationRequest $quotationRequest)
    {
        //
    }
}
