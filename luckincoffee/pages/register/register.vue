<template>
	<view class="">
		<uni-icons class="back" @click="back" type="back" color="#4d96da" size="30"></uni-icons>
		<view class="main">
			<p>账号：</p>
			<uni-easyinput class="uni-mt-5" trim="all" v-model="userName" focus placeholder="请输入账号" @blur="account"></uni-easyinput>
			<p>密码：</p>
			<uni-easyinput type="password" v-model="password" placeholder="请输入密码" @blur="passWord"></uni-easyinput>
			<button @click="userRegister">注册</button>
			<view class="text">
				<label>
					<checkbox :checked="flag" @click="change" style="transform: scale(0.7)" />
				</label>
				<span>
					点击确定，即表示以阅读并同意
					<span style="color: #2979ff" @click="clause">《注册会员服务条款》</span>
				</span>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	onLoad() {
		document.addEventListener('keydown', this.handleKeyPress);
	},

	data() {
		return {
			flag: false,
			userName: '',
			password: ''
		};
	},
	methods: {
		change() {
			this.flag = !this.flag;
		},
		account(e) {
			this.userName = e.detail.value;
			console.log(this.userName);
		},
		passWord(e) {
			this.password = e.detail.value;
			console.log(this.password);
		},
		async userRegister() {
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
					title: '请同意注册协议',
					duration: 1000
				});
			} else {
				let res = await this.$myRequest({
					url: '/register',
					data: {
						userName,
						password
					}
				});
				if (res.data == '1') {
					console.log('成功');
					uni.showToast({
						title: '注册成功！',
						duration: 1000
					});
					setTimeout(() => {
						uni.reLaunch({
							url: '../login/login'
						});
					}, 500);
				} else if ((res.data = '2')) {
					uni.showToast({
						icon: 'error',
						title: '该用户已注册！',
						duration: 1000
					});
					(this.userName = ''), (this.password = '');
				}
			}
		},
		handleKeyPress(e) {
			if (e.key === 'Enter') {
				// 处理键盘Enter事件的逻辑
				this.userRegister();
			}
		},
		back() {
			uni.navigateBack({
				delta: 1
			});
		}
	}
};
</script>

<style scoped>
.main {
	width: 80%;
	height: 250px;
	margin: 100px auto;
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
	padding-top: 20px;
	width: 100%;
	height: 80px;
	margin: 0 auto;
	font-size: 1px;
}
</style>
