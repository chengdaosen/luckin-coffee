<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-margin-wrap">
			<swiper class="swiper" circular :indicator-dots="indicatorDots" :autoplay="autoplay" :interval="interval" :duration="duration">
				<swiper-item v-for="(item, index) in banner" :key="item.id">
					<image :src="item.src"></image>
				</swiper-item>
			</swiper>
		</view>
		<view class="address">
			<view class="left">
				锦江学院店
				<br />
				<span>距您153m</span>
			</view>
			<view class="right">
				<view @click="changes()" :class="{ actives: isActives }">自提</view>
				<view @click="changes()" :class="{ actives: !isActives }">外送</view>
				<view :class="{ show: true, showRight: !isActives }"></view>
			</view>
		</view>
		<view class="main">
			<ul class="menuList">
				<li v-for="(item, index) in menuList" :key="index" @click="order">
					<p style="margin-bottom: 16px">
						{{ item.name }}
						<br />
						<span>{{ item.ename }}</span>
					</p>
					<view><image :src="item.src"></image></view>
				</li>
			</ul>
		</view>
		<view class="bottom">
			<image src="../../static/bottom.png" mode=""></image>
		</view>
	</view>
</template>
<script>
export default {
	data() {
		return {
			indicatorDots: true,
			autoplay: true,
			interval: 2000,
			duration: 500,
			isActives: true,
			banner: [],
			menuList: [
				{ name: '现在下单', ename: 'ORDER NOW', src: '../../static/menulist/3.jpg' },
				{ name: '咖啡钱包', ename: 'COFFRR WALLET', src: '../../static/menulist/1.jpg' },
				{ name: '送Ta咖啡', ename: 'SEND COFFEE', src: '../../static/menulist/2.jpg' },
				{ name: '企业账户', ename: 'ENTERPRISE ACCOUNT', src: '../../static/menulist/4.jpg' }
			]
		};
	},
	onLoad() {
		this.requestBanner();
	},

	methods: {
		order() {
			uni.switchTab({
				url: '/pages/menu/menu'
			});
		},
		changes() {
			// 文字颜色发生改变
			this.isActives = !this.isActives;
			// 修改show的位置
		},

		async requestBanner() {
			const res = await this.$myRequest({
				url: '/'
			});
			this.banner = res.data;
		}
	}
};
</script>
<style scoped>
.actives {
	color: white;
}
.bottom {
	width: 332px;
	height: 55px;
	margin: -7px auto;
}
.bottom image {
	width: 100%;
	height: 100%;
}
* {
	padding: 0;
	margin: 0;
}
ul {
	width: 100%;
	height: inherit;
}
ul li {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-top: 1px solid rgba(242, 242, 242, 1);
	list-style: none;
	width: 335px;
	height: 65px;
	background-color: #fff;
}
ul li p {
	width: 160px;
	height: 24px;
	color: rgba(56, 56, 56, 1);
	font-size: 16px;
	font-weight: bold;
}
ul li p span {
	width: 92px;
	height: 17px;
	color: rgba(128, 128, 128, 1);
	font-size: 11px;
}
ul li view {
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid rgba(99, 71, 58, 1);
	border-radius: 32px;
	width: 40px;
	height: 40px;
}
ul li image {
	margin: 0;
	width: 24px;
	height: 24px;
}
.main {
	width: 341px;
	height: 255px;
	margin: 20px auto;
}
.show {
	width: 44px;
	height: 30px;
	background-color: rgba(136, 175, 213, 1);
	border-radius: 15px;
	position: absolute;
	top: 2px;
	left: 2px;
	z-index: -1;
	transition: all 0.1s ease;
}
.showRight {
	left: 42px !important;
}
.address {
	margin-top: 26rpx;
	width: 100%;
	height: 78rpx;
	display: flex;
	justify-content: space-between;
	font-family: 'Microsoft YaHei';
}
.left {
	margin-left: 40rpx;
	color: rgba(56, 56, 56, 1);
	line-height: 150%;
	font-size: 34rpx;
	line-height: 150%;
	text-align: left;
}
.left > span {
	color: rgba(128, 128, 128, 1);
	width: 50rpx;
	height: 34rpx;
	font-size: 22rpx;
}
.right {
	position: relative;
	margin-right: 20px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 180rpx;
	height: 72rpx;
	color: rgba(80, 80, 80, 1);
	box-shadow: rgba(136, 175, 213, 1) solid 2rpx;
	border-radius: 38rpx;
	font-size: 28rpx;
	line-height: 150%;
	text-align: center;
	border: 2rpx solid rgba(136, 175, 213, 1);
	box-sizing: border-box;
	color: rgba(136, 175, 213, 1);
}
.actives {
	color: white;
}
.uni-margin-wrap {
	width: 100%;
	height: 416rpx;
}
.swiper {
	width: 100%;
	height: 416rpx;
}
.swiper-item {
	width: 100%;
	height: 416rpx;
}
.uni-margin-wrap image {
	width: 100%;
	height: 100%;
}
.wrapper_1110X1 {
	width: 335px;
	height: 39px;
	left: 20px;
	top: 221px;
}
</style>
