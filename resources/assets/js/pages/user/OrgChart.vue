<template>
	<el-row :gutter="20">													
	    <el-col :span="24">

			<div class="col-lg-8" style="height: 100%; overflow: all;">
	        	<vo-edit style="background: #fff"
				    :data="chartData"
				    :toggleCollapse=false
				    :draggable= true
				  >
				</vo-edit>
			</div>
			
			<div class="col-lg-4 view-state">
				<div class="row">
					<div align="center" class="col-lg-12 b-b p-b-10 b-l">
			        	<label style="text-decoration: underline;" class="">Selected Employee</label>
			        	<input disabled style="text-align: center; font-size: 18px" type="text" id="selected-node" class="form-control">
				    </div>
				    <!-- <div class="col-lg-12"><br></div> -->

					<div class="col-lg-12 p-t-10 b-l">
			        	<label class="">New Employee Name</label>
			        	<input type="text" id="new-node" class="form-control">
			      	</div>

			      	<div class="col-lg-12 p-t-10 b-l">
			        	<label class="">New Employee Email</label>
			        	<input type="text" class="form-control">
			      	</div>

			      	<div class="col-lg-12 p-t-10 p-b-10 b-b b-l">
			        	<label class="">New Employee Finanial Limit (AED)</label>
			        	<input type="text" class="new-finanial-limit-node form-control">
			      	</div>
				</div>
				
				<div class="row">
					<div align="center" class="col-lg-12 b-b p-t-10 p-b10 b-l">
				    	<input type="radio" name="node-type" id="rd-parent" value="parent" class=""><label for="rd-parent">Root</label>
				    	<input type="radio" name="node-type" id="rd-child" value="children"><label for="rd-child">Child</label>
				    	<input type="radio" name="node-type" id="rd-sibling" value="siblings"><label for="rd-sibling">Sibling</label>
					</div>
				</div>
				
				<div class="row p-t-10 b-l">
					<div class="col-lg-6">
				    	<button class="btn btn-primary btn-block" @click="addNodes">Add</button>
				    </div>
				    <div class="col-lg-6">
				    	<button class="btn btn-danger btn-block" @click="deleteNodes">Delete</button>
				    </div>
				    <div class="col-lg-12">
				    	<br>
				    	<button class="btn btn-success btn-block" @click="exportJSON">PE Validators Completed</button>
				    </div>
			    </div>
			</div>
			
			
			<hr>

		</el-col>
	</el-row>

</template>


<script>

	export default {

		mountOrgchart() {
	      this.$children.forEach((item) => {
	        item.orgchart !== undefined ? this.orgchart = item.orgchart : null
	      })
	    },
		addNodes() {
	      let chartContainer = document.getElementById('chart-container')
	      let nodeVals = []
	      let validVal = document.getElementById('new-node').value.trim();
	      
	      if (validVal) {
	        nodeVals.push(validVal)
	      }
	      
	      let selectedNode = document.getElementById(document.getElementById('selected-node').dataset.node)
	      if (!nodeVals.length) {
	        Swal('Please enter a name for the new employee','','warning')
	        return
	      }
	      let nodeType = document.querySelector('input[name="node-type"]:checked')
	      if (!nodeType) {
	        Swal('Please select employee insertion type','','warning')
	        return
	      }
	      if (nodeType.value !== 'parent' && !document.querySelector('.orgchart')) {
	        Swal('Please creat the root employee firstly when you want to build up the orgchart from the scratch','','warning')
	        return
	      }
	      if (nodeType.value !== 'parent' && !selectedNode) {
	        Swal('Please select one employee in orgchart','','warning')
	        return
	      }

	      /* eslint-disable */
	      if (nodeType.value === 'parent') {
	      	console.log(nodeType.value);
	      	console.log(nodeVals);
	        if (!chartContainer.children.length) {// if the original chart has been deleted
	          this.orgchart = new OrgChart({
	            'chartContainer': '#chart-container',
	            'data': { 'name': nodeVals[0] },
	            'draggable': true,
	            'toggleCollapse': false,
	            'parentNodeSymbol': 'fa-th-large',
	            'createNode': function (node, data) {
	              node.id = new Date().getTime() * 1000 + Math.floor(Math.random() * 1001);
	            }
	          })
	          this.orgchart.chart.classList.add('view-state')
	        } else {
	          this.orgchart.addParent(chartContainer.querySelector('.node'), { 'name': nodeVals[0], 'Id': this.getId() })
	        }
	      } else if (nodeType.value === 'siblings') {
	        this.orgchart.addSiblings(selectedNode, {
	          'siblings': nodeVals.map(item => {
	            return { 'name': item, 'relationship': '110', 'Id': this.getId() }
	          })
	        })
	      } else {

	        let hasChild = selectedNode.parentNode.colSpan > 1
	        if (!hasChild) {
	          let rel = nodeVals.length > 1 ? '110' : '100'
	          this.orgchart.addChildren(selectedNode, {
	            'children': nodeVals.map(item => {
	              return { 'name': item, 'relationship': rel, 'Id': this.getId() }
	            })
	          })
	        } else {
	        	
	        	this.orgchart.addSiblings(selectedNode.closest('TABLE').querySelector('.nodes').querySelector('.node'), {
		          'siblings': nodeVals.map(item => {
		            return { 'name': item, 'relationship': '110', 'Id': this.getId() }
		          })
		        })

	          // this.orgchart.addSiblings(closest(selectedNode, el => el.nodeName === 'TABLE').querySelector('.nodes').querySelector('.node'),
	          //   { 'siblings': nodeVals.map(function (item) { return { 'name': item, 'relationship': '110', 'Id': this.getId() } })
	          //   })
	        }
	      }
	    },
	    deleteNodes() {
	      let sNodeInput = document.getElementById('selected-node')
	      let sNode = document.getElementById(sNodeInput.dataset.node)
	      if (!sNode) {
	        Swal('Please select an employee from chart','','warning')
	        return
	      } else if (sNode === document.querySelector('.orgchart').querySelector('.node')) {
	        if (!window.confirm('Are you sure you want to delete the whole chart?')) {
	          return
	        }
	      }
	      this.orgchart.removeNodes(sNode)
	      sNodeInput.value = ''
	      sNodeInput.dataset.node = ''
	    },
	    exportJSON() {
	      let datasourceJSON = {}
	      let ChartJSON = this.orgchart.getChartJSON()
	      datasourceJSON = JSON.stringify(ChartJSON, null, 2)
	      if(document.getElementsByTagName('code')[0]) {
	        let code = document.getElementsByTagName('code')[0]
	        code.innerHTML = datasourceJSON
	      }
	      console.log(datasourceJSON);
	      //return datasourceJSON
	    },
	    getId() {
	      return (new Date().getTime()) * 1000 + Math.floor(Math.random() * 1001)
	    }
	}
</script>