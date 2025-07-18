import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'

// Optional: import global CSS
import './styles/global.css'

const app = createApp(App)

// Set base URL for all Axios requests
axios.defaults.baseURL = 'http://localhost:8080/api'

app.use(router)
app.use(VueAxios, axios)

app.mount('#app')
