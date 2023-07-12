<template>
	<view class="body">
		<view class="head">
			<view class="login" @click="login" v-if="!this.token">
				<image src="../../static/head.png"></image>
				<view class="instant">立即登录</view>
				<view class="than">></view>
			</view>
			<view v-else class="login">
				<image :src="this.head"></image>
				<view class="instants">{{ username }}</view>
				<view class="logout" style="color: crimson" @click="logout">退出登录</view>
			</view>
		</view>
		<view class="main">
			<ul>
				<li>
					<image src="../../static/mine/info.jpg" mode=""></image>
					<p>个人资料</p>
					<h2>></h2>
				</li>
				<li>
					<image src="../../static/mine/coffee.jpg" mode=""></image>
					<p>咖啡钱包</p>
					<h2>></h2>
				</li>
				<li>
					<image src="../../static/mine/discount.jpg" mode=""></image>
					<p>优惠券</p>
					<h2>></h2>
				</li>
				<li>
					<image src="../../static/mine/exchange.jpg" mode=""></image>
					<p>兑换优惠</p>
					<h2>></h2>
				</li>
				<li>
					<image src="../../static/mine/manager.jpg" mode=""></image>
					<p>发票管理</p>
					<h2>></h2>
				</li>
				<li>
					<image src="../../static/mine/help.jpg" mode=""></image>
					<p>帮助反馈</p>
					<h2>></h2>
				</li>
			</ul>
		</view>
		<view class="bottom">
			<image src="../../static/menubanner/1.jpg" mode=""></image>
		</view>
	</view>
</template>

<script>
export default {
	onLoad() {
		this.token = uni.getStorageSync('userName');
		console.log(this.token);
		this.reqInfo();
	},
	data() {
		return {
			token: '',
			username: '',
			head: '',
			info: []
		};
	},
	methods: {
		async reqInfo() {
			let username = this.token;
			let res = await this.$myRequest({
				url: '/login',
				data: {
					username
				},
				method: 'post'
			});
			let info = res.data;
			this.username = info[0].username;
			this.head = info[0].src;
		},
		logout() {
			uni.clearStorage('username');
			this.token = '';
			uni.showToast({
				title: '退出成功',
				duration: 1000
			});
			setTimeout(() => {
				uni.reLaunch({
					url: '/my/my'
				});
			}, 1000);
		},
		login() {
			uni.navigateTo({
				url: '../login/login'
			});
		}
	}
};
</script>

<style scoped>
.login:hover {
	color: brown;
}
* {
	padding: 0;
	margin: 0;
}
.main ul li h2 {
	float: right;
	margin-right: 20px;
	color: #f5f5f5;
}
.main ul li image {
	margin-left: 20px;
	margin-top: 18px;
	float: left;
	width: 30px;
	height: 21px;
}
.main ul li p {
	margin-left: 30px;
	float: left;
	width: 80px;
}
.main {
	width: 100%;
	height: 310px;
}
.main ul {
	width: 375px;
	height: 310px;
}
.main ul li {
	width: 375px;
	height: 51px;
	list-style: none;
	background-color: #fff;
	line-height: 51px;
}
.body {
	width: 100%;
	height: 100vh;
	background-color: #f5f5f5;
}
.instant {
	float: left;
	width: 140px;
	line-height: 55px;
	margin-left: 40px;
	color: #fff;
	font-size: 18px;
	font-family: 'Microsoft YaHei';
}
.instants {
	float: left;
	width: 140px;
	line-height: 55px;
	margin-left: 20px;
	color: #fff;
	font-size: 18px;
	font-family: 'Microsoft YaHei';
}
.than {
	float: right;
	width: 20px;
	color: #fff;
	line-height: 55px;
}
.logout {
	float: right;
	width: 80px;
	color: #fff;
	line-height: 55px;
}
.head {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 180px;
	background-image: url(../../static/背景.gif);
	background-size: 100% 180px;
}
.login image {
	float: left;
	width: 55px;
	height: 55px;
	border-radius: 30px;
}
.login {
	width: 335px;
	height: 55px;
}

.bottom {
	margin-top: 10px;
	position: relative;
	width: 100%;
	height: 114px;
}
.bottom image {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 335px;
	height: 114px;
}
</style>
