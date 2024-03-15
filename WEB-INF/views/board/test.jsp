<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header 입니다 -->
<%@include file="../include/header.jsp"%>
<!-- header 입니다 -->


<section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">Checkout</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs">Item</th>
                      <th>Description</th>
                      <th class="hidden-xs">Price</th>
                      <th>Quantity</th>
                      <th>Total</th>
                      <th>Remove</th>
                    </tr>
                    <tr>
                      <td class="hidden-xs"><a href="#"><img src="assets/images/shop/product-14.jpg" alt="Accessories Pack"/></a></td>
                      <td>
                        <h5 class="product-title font-alt">Accessories Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">£20.00</h5>
                      </td>
                      <td>
                        <input class="form-control" type="number" name="" value="1" max="50" min="1"/>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">£20.00</h5>
                      </td>
                      <td class="pr-remove"><a href="#" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr>
                    <tr>
                      <td class="hidden-xs"><a href="#"><img src="assets/images/shop/product-13.jpg" alt="Men’s Casual Pack"/></a></td>
                      <td>
                        <h5 class="product-title font-alt">Men’s Casual Pack</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt">£20.00</h5>
                      </td>
                      <td>
                        <input class="form-control" type="number" name="" value="1" max="50" min="1"/>
                      </td>
                      <td>
                        <h5 class="product-title font-alt">£20.00</h5>
                      </td>
                      <td class="pr-remove"><a href="#" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

        </section>



<!-- footer 입니다 -->

<%@include file="../include/footer.jsp"%>
<!-- footer 입니다 -->