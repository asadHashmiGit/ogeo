
require('./bootstrap');

// import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import 'vue-form-wizard/dist/vue-form-wizard.min.css';
import 'element-ui/lib/theme-chalk/index.css';
import 'vue-orgchart/dist/style.min.css';
// import LogRocket from 'logrocket';

// LogRocket.init('8h0uiy/ogeo');


import Vue from 'vue';
import VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';
import Vuex from 'vuex';
import VueEvents from 'vue-events'
import vSelect from 'vue-select';
import ElementUI from 'element-ui';
import VueStickyKit from 'vue-stickykit';
import locale from 'element-ui/lib/locale/lang/en'
import {routes} from './routes';
import StoreData from './store';
import {initialize} from './helpers/general.js';
import MainApp from './core/MainApp.vue';
import VendorsAccess from './core/VendorsAccess.vue';
import VueFormWizard from 'vue-form-wizard';
import BootstrapVue from 'bootstrap-vue';
import moment from 'moment';
import VueCookies from 'vue-cookies'

import * as d3 from 'd3';


import {
  Pagination,
  Dialog,
  Autocomplete,
  Dropdown,
  DropdownMenu,
  DropdownItem,
  Menu,
  Submenu,
  MenuItem,
  MenuItemGroup,
  Input,
  InputNumber,
  Radio,
  RadioGroup,
  RadioButton,
  Checkbox,
  CheckboxButton,
  CheckboxGroup,
  Switch,
  Select,
  Option,
  OptionGroup,
  Button,
  ButtonGroup,
  Table,
  TableColumn,
  DatePicker,
  TimeSelect,
  TimePicker,
  Popover,
  Tooltip,
  Breadcrumb,
  BreadcrumbItem,
  Form,
  FormItem,
  Tabs,
  TabPane,
  Tag,
  Tree,
  Alert,
  Slider,
  Icon,
  Row,
  Col,
  Upload,
  Progress,
  Badge,
  Card,
  Rate,
  Steps,
  Step,
  Carousel,
  CarouselItem,
  Collapse,
  CollapseItem,
  Cascader,
  ColorPicker,
  Transfer,
  Container,
  Header,
  Aside,
  Main,
  Footer,
  Loading,
  MessageBox,
  Message,
  Notification
} from 'element-ui';


Vue.use(ElementUI,{ locale }, { size: 'small', zIndex: 3000 });
Vue.use(VueFormWizard);
Vue.use(VueStickyKit);
Vue.use(VueRouter);
Vue.use(VueAxios, axios);
Vue.use(Vuex);
Vue.use(VueEvents)
Vue.use(BootstrapVue)
Vue.use(VueCookies)


Vue.use(Pagination);
Vue.use(Dialog);
Vue.use(Autocomplete);
Vue.use(Dropdown);
Vue.use(DropdownMenu);
Vue.use(DropdownItem);
Vue.use(Menu);
Vue.use(Submenu);
Vue.use(MenuItem);
Vue.use(MenuItemGroup);
Vue.use(Input);
Vue.use(InputNumber);
Vue.use(Radio);
Vue.use(RadioGroup);
Vue.use(RadioButton);
Vue.use(Checkbox);
Vue.use(CheckboxButton);
Vue.use(CheckboxGroup);
Vue.use(Switch);
Vue.use(Select);
Vue.use(Option);
Vue.use(OptionGroup);
Vue.use(Button);
Vue.use(ButtonGroup);
Vue.use(Table);
Vue.use(TableColumn);
Vue.use(DatePicker);
Vue.use(TimeSelect);
Vue.use(TimePicker);
Vue.use(Popover);
Vue.use(Tooltip);
Vue.use(Breadcrumb);
Vue.use(BreadcrumbItem);
Vue.use(Form);
Vue.use(FormItem);
Vue.use(Tabs);
Vue.use(TabPane);
Vue.use(Tag);
Vue.use(Tree);
Vue.use(Alert);
Vue.use(Slider);
Vue.use(Icon);
Vue.use(Row);
Vue.use(Col);
Vue.use(Upload);
Vue.use(Progress);
Vue.use(Badge);
Vue.use(Card);
Vue.use(Rate);
Vue.use(Steps);
Vue.use(Step);
Vue.use(Carousel);
Vue.use(CarouselItem);
Vue.use(Collapse);
Vue.use(CollapseItem);
Vue.use(Cascader);
Vue.use(ColorPicker);
Vue.use(Transfer);
Vue.use(Container);
Vue.use(Header);
Vue.use(Aside);
Vue.use(Main);
Vue.use(Footer);
Vue.use(Loading.directive);

Vue.filter('formatDateNTime', function(value) {
  if (value) {
    return moment(String(value)).format('DD.MMM.YY (HH:mm:ss)')
  }
});

Vue.filter('formatDateNoTime', function(value) {
  if (value) {
    return moment(String(value)).format('DD.MMM.YY')
  }
});

Vue.filter('getDifference', function(Date1, Date2) {

  let PreviousDate = moment(Date1, 'DD.MMM.YYYY - (HH:mm:ss)'); //moment(String(Date1));
  let CurrentDate = moment(Date2, 'DD.MMM.YYYY - (HH:mm:ss)'); //moment(String(Date2));
  let DifferenceInMinutes = PreviousDate.diff(CurrentDate, "minutes");
  if(DifferenceInMinutes < 60){
      return DifferenceInMinutes+' Minute(s)';
  } else if (DifferenceInMinutes > 60 && DifferenceInMinutes < 1440) {
      let DifferenceInHours = DifferenceInMinutes/60;
      DifferenceInHours = DifferenceInHours.toString(10).split(".");
      let RemainingMinutes = parseFloat('0.'+DifferenceInHours[1]) * 60;
      RemainingMinutes = RemainingMinutes.toString(10).split(".");
      return DifferenceInHours[0]+' Hours(s)\n'+RemainingMinutes[0]+' Minute(s)';
  } else if (DifferenceInMinutes > 1440) {
      let DifferenceInDays = DifferenceInMinutes/60/24;
      DifferenceInDays = DifferenceInDays.toString(10).split(".");
      let RemainingHours = parseFloat('0.'+DifferenceInDays[1]) * 24;
      RemainingHours = RemainingHours.toString(10).split(".");
      let RemainingMinutes = parseFloat('0.'+RemainingHours[1]) * 60;
      RemainingMinutes = RemainingMinutes.toString(10).split(".");
      //return $DifferenceInDays[0].' Day(s)<br>'.$RemainingHours[0].' Hour(s)<br>'.$RemainingMinutes[0].' Minute(s)';
      return DifferenceInDays[0]+' Day(s) and\n'+RemainingHours[0]+' Hour(s)';
  }
  return PreviousDate.diff(CurrentDate, "minutes") + " Minutes";
  
});


Vue.prototype.$loading = Loading.service;
Vue.prototype.$msgbox = MessageBox;
Vue.prototype.$alert = MessageBox.alert;
Vue.prototype.$confirm = MessageBox.confirm;
Vue.prototype.$prompt = MessageBox.prompt;
Vue.prototype.$notify = Notification;
Vue.prototype.$message = Message;
Vue.prototype.moment = moment;




const router = new VueRouter({
	mode: 'history',
	routes,
});
const store = new Vuex.Store(StoreData);

initialize(store, router);

Vue.router = router;
Vue.store = store;

Vue.axios.defaults.baseURL = '/';


const token = localStorage.getItem('access-token')
if (token) {
  axios.defaults.headers.common['Authorization'] = 'Bearer '+token
  $.ajaxSetup({ headers: { 'Authorization': 'Bearer '+token } });
}


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */


Vue.component('v-select', vSelect);


const app = new Vue({
    el: '#app',
    router: router,
    store: store,
    components: {
      MainApp,
    	VendorsAccess,
    	VueFormWizard,
    }
});
