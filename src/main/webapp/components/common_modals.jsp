
<!--modal for cart-items-->

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #8c9eff; color: white;">
        <h5 class="modal-title" id="exampleModalLabel">Your cart</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="cart-body">
              
              
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">Checkout</button>
      </div>
    </div>
  </div>
</div>

<!--toast div-->
<div id="toast">This is our custom Toast text</div>