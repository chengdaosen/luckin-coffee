import App from './App'
import {
	myRequest
} from './util/api.js'

// #ifndef VUE3

import Vue from 'vue'
import './uni.promisify.adaptor'
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
	...App
})
app.$mount()

// #endif
// 在初始化Vue实例之前，先跳转到过渡页
uni.redirectTo({
	url: './pages/transition/transition' // 过渡页的路径
})
Vue.prototype.$myRequest = myRequest
// Vue.prototype.$myRequest = myRequest
// #ifdef VUE3
import {
	createSSRApp
} from 'vue'
export function createApp() {
	const app = createSSRApp(App)
	return {
		app
	}
}
// #endif