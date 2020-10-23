<template>
    
    <div >
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->    
        <!-- ============================================================== -->
        <header class="topbar" style="background-color: #FF2F2F; position: fixed; width: 100%;">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header toplogo">
                    <a class="navbar-brand" href="/app/dashboard">
                        <!-- Logo icon -->
                        <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                        <!-- Dark Logo icon -->
                        
                            <div align="center" style="position:relative; top: 1px;" class="row">
                                <div class="col-lg-12 m-t-0">
                                    <img  width="35%" src="/assets/images/logo_symbol_white.png" alt="Ogeo Logo">
                                </div>
                                <!-- <div class="col-lg-4">
                                    <img width="400%" src="/assets/images/ogeo-solgan.png" alt="Ogeo Logo">
                                    <img width="100%" src="/assets/images/logo-no-symbol.png" alt="Ogeo Logo">
                                    <span style="font-family: 'Quicksand'; color: white; font-size: 16px;  margin-left: -40%; width:100%">PROCUREMENT. OPTIMIZED.</span>
                                </div> -->
                            </div>
                       
                        <!-- <span><img src="/assets/images/logo_transparent.svg" alt=""></span>
                        <span style="font-family: 'Grand Hotel', cursive;  color: #FF2F2F; font-size: 32px; font-weight: 300">Ogéo.</span> -->
                        <!-- <img :src="logo_icon"  alt="homepage" class="dark-logo" /> -->
                        <!-- Light Logo icon -->
                        <!-- <img :src="logo_light_icon"  alt="homepage" class="light-logo" /> -->
                        
                        <!--End Logo icon -->
                        <!-- Logo text -->
                         <!-- dark Logo text -->
                         <!-- <span> <img :src="logo_text" alt="homepage" class="dark-logo" /> -->
                         <!-- Light Logo text -->    
                         <!-- <img :src="logo_light_text" class="light-logo" alt="homepage" /></span>  -->
                         
                    </a>
                    
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <!-- <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li> -->
                        <!-- ============================================================== -->
                        <!-- Messages -->
                        <!-- ============================================================== -->
                        <!-- <li class="nav-item dropdown mega-dropdown"> <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="mdi mdi-view-grid"></i></a>
                            <div class="dropdown-menu scale-up-left">
                                <ul class="mega-dropdown-menu row">
                                    <li class="col-lg-3 col-xlg-2 m-b-30">
                                        <h4 class="m-b-20">CAROUSEL</h4>
                                        CAROUSEL
                                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                            <div class="carousel-inner" role="listbox">
                                                <div class="carousel-item active">
                                                    <div class="container"> <img class="d-block img-fluid" :src="img1" alt="First slide"></div>
                                                </div>
                                                
                                                <div class="carousel-item">
                                                    <div class="container"><img class="d-block img-fluid" :src="img2" alt="Second slide"></div>
                                                </div>
                                                <div class="carousel-item">
                                                    <div class="container"><img class="d-block img-fluid" :src="img3" alt="Third slide"></div>
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
                                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
                                        </div>
                                        End CAROUSEL
                                    </li>
                                    <li class="col-lg-3 m-b-30">
                                        <h4 class="m-b-20">Quick Tips</h4>
                                        Accordian
                                        <div id="accordion" class="nav-accordion" role="tablist" aria-multiselectable="true">
                                            <div class="card">
                                                <div class="card-header" role="tab" id="headingOne">
                                                    <h5 class="mb-0">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                  Collapsible Group Item #1
                                                </a>
                                              </h5> </div>
                                                <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                                                    <div class="card-body"> Anim pariatur cliche reprehenderit, enim eiusmod high. </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" role="tab" id="headingTwo">
                                                    <h5 class="mb-0">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                  Collapsible Group Item #2
                                                </a>
                                              </h5> </div>
                                                <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
                                                    <div class="card-body"> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" role="tab" id="headingThree">
                                                    <h5 class="mb-0">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                  Collapsible Group Item #3
                                                </a>
                                              </h5> </div>
                                                <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
                                                    <div class="card-body"> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="col-lg-3  m-b-30">
                                        <h4 class="m-b-20">CONTACT US</h4>
                                        Contact
                                        <form>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="exampleInputname1" placeholder="Enter Name"> </div>
                                            <div class="form-group">
                                                <input type="email" class="form-control" placeholder="Enter email"> </div>
                                            <div class="form-group">
                                                <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="Message"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-info">Submit</button>
                                        </form>
                                    </li>
                                    <li class="col-lg-3 col-xlg-4 m-b-30">
                                        <h4 class="m-b-20">Quick Links</h4>
                                        List style
                                        <ul class="list-style-none">
                                            <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> View Dashboard</a></li>
                                            <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> Profile Area</a></li>
                                            <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> My Roles</a></li>
                                            <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> Logout</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </li> -->
                        <!-- ============================================================== -->
                        <!-- End Messages -->
                        <!-- ============================================================== -->
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Comment -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-message"></i>
                                
                                <div v-if="InboxMessages.length != 0" style="color: gray; background-color: gray" class="notify"> 
                                        <span style="color: gray; background-color: gray" class="heartbit"></span> 
                                        <span style="color: gray; background-color: gray" class="point"></span> 
                                </div>

                            </a>
                            <div class="dropdown-menu dropdown-menu-right mailbox scale-up">
                                <ul>
                                    <li>
                                        <div class="drop-title">Notifications</div>
                                    </li>
                                    <li>
                                        <div class="message-center">
                                            <!-- Message -->
                                            <a v-for="(message, index ) in InboxMessages" :key="index" href="#">
                                                <div class="btn btn-success btn-circle" @click="removeNotification(index)" title="Mark As Read"><i class="fa fa-check"></i></div>
                                                <div style="margin-left: 5px" class="mail-contnet">
                                                    <h5>{{ message.title }}</h5> 
                                                    <span class="mail-desc">{{ message.body }}</span> 
                                                    <span class="time" style="font-size: 10px"><br>{{ message.timestamp }}</span> </div>
                                            </a>
                                            <!-- Message -->
                                            <!-- <a href="#">
                                                <div class="btn btn-success btn-circle"><i class="ti-calendar"></i></div>
                                                <div class="mail-contnet">
                                                    <h5>Event today</h5> <span class="mail-desc">Just a reminder that you have event</span> <span class="time">9:10 AM</span> </div>
                                            </a>
                                            Message
                                            <a href="#">
                                                <div class="btn btn-info btn-circle"><i class="ti-settings"></i></div>
                                                <div class="mail-contnet">
                                                    <h5>Settings</h5> <span class="mail-desc">You can customize this template as you want</span> <span class="time">9:08 AM</span> </div>
                                            </a>
                                            Message
                                            <a href="#">
                                                <div class="btn btn-primary btn-circle"><i class="ti-user"></i></div>
                                                <div class="mail-contnet">
                                                    <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
                                            </a> -->
                                        </div>
                                    </li>
                                    <!-- <li>
                                        <a class="nav-link text-center" href="javascript:void(0);"> <strong>Check all notifications</strong> <i class="fa fa-angle-right"></i> </a>
                                    </li> -->
                                </ul>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- End Comment -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- Messages -->
                        <!-- ============================================================== -->
                        <!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-email"></i>
                                <div class="notify"> <span class="heartbit"></span> <span class="point"></span> </div>
                            </a>
                            <div class="dropdown-menu mailbox dropdown-menu-right scale-up" aria-labelledby="2">
                                <ul>
                                    <li>
                                        <div class="drop-title">You have 4 new messages</div>
                                    </li>
                                    <li>
                                        <div class="message-center">
                                            Message
                                            <a href="#">
                                                <div class="user-img"> 
                                                        <img :src="user1" alt="user" class="img-circle"/> <span class="profile-status online pull-right"></span> </div>
                                                <div class="mail-contnet">
                                                    <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:30 AM</span> </div>
                                            </a>
                                            Message
                                            
                                            <a href="#">
                                                <div class="user-img"> <img :src="user2" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
                                                <div class="mail-contnet">
                                                    <h5>Sonu Nigam</h5> <span class="mail-desc">I've sung a song! See you at</span> <span class="time">9:10 AM</span> </div>
                                            </a>
                                            Message
                                            <a href="#">
                                                <div class="user-img"> <img :src="user3" alt="user" class="img-circle"> <span class="profile-status away pull-right"></span> </div>
                                                <div class="mail-contnet">
                                                    <h5>Arijit Sinh</h5> <span class="mail-desc">I am a singer!</span> <span class="time">9:08 AM</span> </div>
                                            </a>
                                            Message
                                            <a href="#">
                                                <div class="user-img"> <img :src="user4" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span> </div>
                                                <div class="mail-contnet">
                                                    <h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
                                            </a>
                                        </div>
                                    </li>
                                    <li>
                                        <a class="nav-link text-center" href="javascript:void(0);"> <strong>See all e-Mails</strong> <i class="fa fa-angle-right"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </li> -->
                        <!-- ============================================================== -->
                        <!-- End Messages -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img :src="'/uploads/ProfileImages/'+currentUser.Picture"  alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right scale-up">
                                <ul class="dropdown-user">
                                    <li>
                                        <div align="center" class="dw-user-box">
                                            <div class="u-img">
                                                <img :src="'/uploads/ProfileImages/'+currentUser.Picture" alt="user"/>
                                                <br><br>
                                            </div>
                                            <div class="u-text">
                                                <h4>{{ currentUser.name }}</h4>
                                                <p class="text-muted">{{ currentUser.Email }}</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li v-if="currentUser.CompanyId != null" role="separator" class="divider"></li>

                                    <li v-if="currentUser.CompanyId != null"><router-link to="/app/profile"><i class="ti-user"></i> My Profile</router-link></li>
                                    <li v-if="currentUser.hasOwnProperty('CAD') && currentUser.CompanyId != null"><router-link to="/app/company_settings"><i class="ti-settings"></i> Organization Configuration</router-link></li>
                                    <li v-if="currentUser.hasOwnProperty('CAD') && currentUser.CompanyId != null"><router-link to="/app/manage_projects"><i class="ti-settings"></i> Manage Set-ups</router-link></li>
                                    <!-- <li><a href="#"><i class="ti-email"></i> Inbox</a></li> -->
                                    
                                    <li v-if="currentUser.CompanyId === null" role="separator" class="divider"></li>
                                    <li v-if="currentUser.CompanyId === null"><router-link to="/app/account_settings"><i class="ti-settings"></i> Account Setting</router-link></li>


                                    <li role="separator" class="divider"></li>
                                    <li><a href="#!" @click.prevent="logout"><i class="fa fa-power-off"></i> Logout</a></li>
                                </ul>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- Language -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="flag-icon flag-icon-us"></i></a>
                            <div class="dropdown-menu dropdown-menu-right scale-up"> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-in"></i> India</a> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-fr"></i> French</a> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-cn"></i> China</a> <a class="dropdown-item" href="#"><i class="flag-icon flag-icon-de"></i> Dutch</a> </div>
                        </li>
                    </ul>
                </div>
            </nav>

        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <br><br><br>
            

    </div>
</template>
<script>
    
    import LogRocket from 'logrocket';

    export default {
        name: 'app-header',
        data(){
            return {
                InboxMessages: [],
                newPublicMessage: [],
                newCompanyMessage: [],
                newUserMessage: [],
                stikyKit: {
                  options: {
                    offset_top: 0
                  },
                },
                logo_icon: "/assets/images/logo-icon.png",
                logo_light_icon: "/assets/images/logo-light-icon.png",
                logo_text: "/assets/images/logo-text-ogeo.png",
                logo_light_text: "/assets/images/logo-light-text-ogeo.png",
                img1: "/assets/images/big/img1.jpg",
                img2: "/assets/images/big/img2.jpg",
                img3: "/assets/images/big/img3.jpg",
                user1: "/assets/images/users/1.jpg",
                user2: "/assets/images/users/2.jpg",
                user3: "/assets/images/users/3.jpg",
                user4: "/assets/images/users/4.jpg"
            }
        },
        methods: {
            removeNotification(index){
                this.InboxMessages.splice(index, 1);
            },
            logout(){

                if(this.$route.path != "/app/account_settings"){
                    console.log(this.$route.path);
                    this.$store.dispatch('logout')
                    .then(() => {
                      this.$router.push('/')
                    });
                } else {
                    this.$router.push('/')
                    console.log(this.$route.path + ' Logging Out From The Actual account_settings View.');
                }
              
            },
        },
        computed: {
            currentUser(){
                return this.$store.getters.currentUser;
            }
        },
        mounted(){

            let self = this;

            let UserDetails = this.$store.getters.currentUser;
            
            LogRocket.identify(UserDetails.userId, {
              name: UserDetails.Name,
              email: UserDetails.Email,
            });

            /* This is Public Channel */
            Echo.channel('MessageToAllSystemUsers')
                .listen('.newMessage', (message) => {

                    self.newPublicMessage = message;
                    
                    const h = this.$createElement
                    const vNodesMsg = h(
                      'p',
                      { class: ['mb-2 mt-2'] },
                      [
                        `${message.body} `,
                        h('br'),
                        h('br'),
                        h('small', { class: 'mr-2 pull-right' }, `Sent By: ${message.username}`),
                      ],
                    )
                    const vNodesTitle = h(
                      'div',
                      { class: ['d-flex', 'flex-grow-1', 'align-items-baseline', 'mr-2'] },
                      [
                        h('strong', { class: 'mr-2' }, `${message.title}`),
                        h('small', { class: 'ml-auto text-italics' }, `${message.timestamp}`)
                      ]
                    )
                    this.$bvToast.toast([vNodesMsg], {
                      title: [vNodesTitle],
                      autoHideDelay: 10000,
                      variant: 'secondary',
                      solid: true,
                    })
         

                    this.InboxMessages.push(message);
                });


            Echo.private('MessageToAllCompanyUsers.'+ this.$store.getters.currentUser.CompanyId)
                .listen('.newMessage', (message) => {
                    
                    const h = this.$createElement
                    const vNodesMsg = h(
                      'p',
                      { class: ['mb-2 mt-2'] },
                      [
                        `${message.body} `,
                        h('br'),
                        h('br'),
                        h('small', { class: 'mr-2 pull-right' }, `Sent By: ${message.username}`),
                      ],
                    )
                    const vNodesTitle = h(
                      'div',
                      { class: ['d-flex', 'flex-grow-1', 'align-items-baseline', 'mr-2'] },
                      [
                        h('strong', { class: 'mr-2' }, `${message.title}`),
                        h('small', { class: 'ml-auto text-italics' }, `${message.timestamp}`)
                      ]
                    )
                    this.$bvToast.toast([vNodesMsg], {
                      title: [vNodesTitle],
                      autoHideDelay: 10000,
                      variant: 'secondary',
                      solid: true,
                    })

                    this.InboxMessages.push(message);

            });


            Echo.private('MessageToAUser.'+ this.$store.getters.currentUser.userId)
                .listen('.newMessage', (message) => {
                    
                    const h = this.$createElement
                    const vNodesMsg = h(
                      'p',
                      { class: ['mb-2 mt-2'] },
                      [
                        `${message.body} `,
                        h('br'),
                        h('br'),
                        h('small', { class: 'mr-2 pull-right' }, `Sent By: ${message.username}`),
                      ],
                    )
                    const vNodesTitle = h(
                      'div',
                      { class: ['d-flex', 'flex-grow-1', 'align-items-baseline', 'mr-2'] },
                      [
                        h('strong', { class: 'mr-2' }, `${message.title}`),
                        h('small', { class: 'ml-auto text-italics' }, `${message.timestamp}`)
                      ]
                    )
                    this.$bvToast.toast([vNodesMsg], {
                      title: [vNodesTitle],
                      autoHideDelay: 10000,
                      variant: 'secondary',
                      solid: true,
                    })

                    this.InboxMessages.push(message);

            });


            Echo.private('MessageToUserToTakeAction.'+ this.$store.getters.currentUser.userId)
                .listen('.newMessage', (message) => {


                    self.$store.dispatch("update_user_pending_tasks").then(response => {
                        console.log("Pending Tasks Updated");
                    }, error => {
                        console.error("Pending Tasks Update Error")
                    })

                    
                    const h = this.$createElement
                    const vNodesMsg = h(
                      'p',
                      { class: ['mb-2 mt-2'] },
                      [
                        `${message.body} `,
                        // h('br'),
                        // h('br'),
                        // h('small', { class: 'mr-2 pull-right' }, `Sent By: ${message.username}`),
                      ],
                    )
                    const vNodesTitle = h(
                      'div',
                      { class: ['d-flex', 'flex-grow-1', 'align-items-baseline', 'mr-2'] },
                      [
                        h('strong', { class: 'mr-2' }, `${message.title}`),
                        h('small', { class: 'ml-auto text-italics' }, `${message.timestamp}`)
                      ]
                    )
                    this.$bvToast.toast([vNodesMsg], {
                      title: [vNodesTitle],
                      autoHideDelay: 10000,
                      variant: 'secondary',
                      solid: true,
                    })

                    this.InboxMessages.push(message);

            });

        }
    }
</script>

<style scoped>

    .bs-example{
        margin: 20px;
    }
    

</style>