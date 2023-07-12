<template>
	<view class="login">
		<uni-icons class="back" @click="back" type="back" color="#4d96da" size="30"></uni-icons>
		<view class="img">
			<image src="../../static/login.png" mode=""></image>
		</view>
		<view class="main">
			<p>账号：</p>
			<uni-easyinput class="uni-mt-5" trim="all" v-model="userName" focus placeholder="请输入账号" @blur="account"></uni-easyinput>
			<p>密码：</p>
			<uni-easyinput type="password" v-model="password" placeholder="请输入密码" @blur="passWord"></uni-easyinput>
			<button @click="userLogin">登录</button>
			<view class="register">
				<span style="color: #2979ff; float: right" @click="skipRegister">立即注册</span>
				<p style="float: right; font-size: 10px">还没有账号？</p>
			</view>
			<view class="text">
				<label>
					<checkbox :checked="flag" @click="change" style="transform: scale(0.7)" />
				</label>
				<span>
					点击确定，即表示以阅读并同意
					<span style="color: #2979ff" @click="clause">《登录会员服务条款》</span>
				</span>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	onLoad() {
		document.addEventListener('keydown', this.handleKeyPress);
		console.log(this.flag);
	},
	data() {
		return {
			flag: false,
			userName: '',
			password: ''
		};
	},
	methods: {
		skipRegister() {
			uni.reLaunch({
				url: '../register/register'
			});
		},
		change() {
			this.flag = !this.flag;
		},
		handleKeyPress(e) {
			if (e.key === 'Enter') {
				// 处理键盘Enter事件的逻辑
				this.userLogin();
			}
		},
		back() {
			uni.navigateBack({
				delta: 1
			});
		},
		account(e) {
			this.userName = e.detail.value;
		},
		passWord(e) {
			this.password = e.detail.value;
		},
		clause() {
			uni.navigateTo({
				url: '../clause/clause'
			});
		},
		async userLogin() {
			console.log(this.flag);
			let userName = this.userName;
			let password = this.password;
			if (userName.length == 0) {
				uni.showToast({
					icon: 'error',
					title: '请输入用户账号！',
					duration: 1000
				});
			} else if (password.length == 0) {
				uni.showToast({
					icon: 'error',
					title: '请输入用户密码！',
					duration: 1000
				});
			} else if (!this.flag) {
				uni.showToast({
					icon: 'error',
					title: '请同意协议',
					duration: 1000
				});
			} else {
				let res = await this.$myRequest({
					url: '/login',
					data: {
						userName,
						password
					}
				});
				if (res.data == '1') {
					uni.setStorageSync('userName', userName);
					uni.showToast({
						title: '成功登录',
						duration: 1000
					});
					setTimeout(() => {
						console.log(userName);
						uni.reLaunch({
							url: '../my/my'
						});
					}, 500);
				} else if (res.data == '2') {
					console.log('错误');
					uni.showToast({
						icon: 'error',
						title: '用户密码错误',
						duration: 1000
					});
				} else if (res.data == '3') {
					uni.showToast({
						icon: 'error',
						title: '该用户不存在，请注册！',
						duration: 1000
					});
				}
			}
		}
	}
};
</script>

<style scoped>
.register {
	line-height: 40px;
	width: 200px;
	height: 40px;
}

.main {
	width: 80%;
	height: 250px;
	margin: 0 auto;
}
.img {
	width: 80px;
	height: 94px;
	margin: 100px auto;
}
image {
	width: 80px;
	height: 94px;
}
.main button {
	width: 80%;
	height: 40px;
	line-height: 40px;
	margin: 30px auto 0 auto;
	border-radius: 10px;
	background-color: #2979ff;
	color: aliceblue;
}
.text {
	width: 100%;
	height: 80px;
	margin: 0 auto;
	font-size: 1px;
}
.back {
	position: fixed;
	width: 30px;
	height: 30px;
	border-radius: 15px;
	background-color: rgba(155, 170, 255, 0.2);
	font-size: 1px;
	top: 10px;
	left: 10px;
	z-index: 999;
}
</style>
