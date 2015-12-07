<div class="text-center" ng-controller="historyController">
       		<div class="row">
                  <div class="col-lg-12" >
                    <!-- <div ng-if="hasPending()"> -->
                      <section class="panel">
                          <header class="panel-heading">
                              Pending Transactions 
                          </header>
                          <div class="panel-body">
                        <form id="pendingList" action="history" method="get">
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_star"></i> User ID</th>
                                 <th><i class="icon_calendar"></i> Stock ID</th>
                                 <th><i class="icon_calulator"></i> Quantity</th>
                                 <th><i class="icon_currency_alt"></i> Stock Price</th>
                                 <th><i class="icon_mobile"></i> Transaction Time</th>
                                 <th><i class="icon_mobile"></i> Cancel</th>
                                 <th><i class="icon_cogs"></i> <input type="checkbox" name="selectAll" ng-model="selectAll" 
						         ng-click="checkAll($event)"/></th>
                              </tr>
                              <tr ng-repeat="pending in pendingList">
								 <td>{{pending.own.user.uid}}</td>
								 <td>{{pending.own.stock.sid}}</td>
								 <td>{{pending.amount}}</td>
								 <td>{{pending.price}}</td>
								 <td>{{pending.ts}}</td>
                                 <td>
                                  <div class="btn-group">
                                      <button class="cancel" name="cancel" 
									value={{pendingList.indexOf(pending)}}>Cancel</button>
                                  </div>
                                  </td>
                                  <td>
									<input id="tagglebox" ng-checked="selectAll" type="checkbox" 
									checklist-value="pendingList.indexOf(pending)" checklist-model="selected.pending" /> 
								  </td>
                              </tr>
                           </tbody>
                        </table>
                        
                        <br/>
						<div>
							<button class="cancel" name="cancelAll" value={{selected.pending}}>Cancel Selected</button>
						</div>
                       </form>
                       </div>
                      </section>
                    </div>
                <!--   </div> -->
              </div>
        
              <!-- page end-->
              

              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              Transaction History 
                          </header>
                          <div class="panel-body">
                          <div ng-if="!hasTran()">
							<h1>No transaction history</h1>
						  </div>
						  
				     <div ng-if="hasTran()">
				     	<form id="search" style="margin-bottom: 15px;text-align: center;">
							<label>Key word: </label>
							<input type="text" placeholder="Filter by" ng-model="criteria"/>
							<label>Between </label>
							<input type="date" name="lower" ng-model="startDate"/>
							<label>and</label>
							<input type="date" name="upper" ng-model="endDate"/>
						</form>
                
                          <table class="table table-striped table-advance table-hover" id="transHistory" >
                           <tbody>
                              <tr>
								<th>
									<a href="" ng-click="order('tid')">TID</a>
       								<span class="sortorder" ng-show="predicate === 'tid'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('own.user.userName')">Username</a>
       								<span class="sortorder" ng-show="predicate === 'own.user.userName'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('own.stock.symbol')">Stock Symbol</a>
       								<span class="sortorder" ng-show="predicate === 'own.stock.symbol'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('amount')">Amount</a>
       								<span class="sortorder" ng-show="predicate === 'amount'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('price')">Price</a>
       								<span class="sortorder" ng-show="predicate === 'price'" ng-class="{reverse:reverse}"></span>
								</th>
								<th>
									<a href="" ng-click="order('ts')">Transaction Time</a>
       								<span class="sortorder" ng-show="predicate === 'ts'" ng-class="{reverse:reverse}"></span>
								</th>
                              </tr>
                              <tr ng-repeat="tran in transList |dateRange:startDate:endDate |filter:criteria| orderBy:predicate:reverse">
								<td>{{tran.tid}}</td>
								<td>{{tran.own.user.userName}}</td>
								<td>{{tran.own.stock.symbol}}</td>
								<td>{{tran.amount}}</td>
								<td>{{tran.price}}</td>
								<td>{{tran.ts}}</td>
                              </tr>
                           </tbody>
                        </table>
                      </div>
                      </div>
                      </section>
                  </div>
              </div>
</div>
