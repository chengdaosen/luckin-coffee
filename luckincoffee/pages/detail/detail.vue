<template>
	<view class="body">
		<uni-icons class="back" @click="back" type="back" color="#f5f5f5" size="30"></uni-icons>
		<view v-for="(item, index) in commodity" :key="item.id">
			<image class="index" :src="item.src1">
				<uni-fav
					:checked="checkList"
					class="favBtn"
					:circle="true"
					bg-color="#dd524d"
					bg-color-checked="#007aff"
					fg-color="#ffffff"
					fg-color-checked="#ffffff"
					@click="favClick(2)"
					style="position: absolute; right: 32px; top: 255px"
				/>
			</image>
			<view class="option">
				<h3>{{ title }}</h3>
				<view class="describe">
					<ul>
						<li>杯型</li>
						<li>温度</li>
						<li>糖分</li>
					</ul>
				</view>
				<view class="choose">
					<ul>
						<li><button style="border: 1px solid #2979ff">大杯</button></li>
						<li>
							<button style="border: 1px solid #2979ff">冰</button>
							<button @click="buttonClick(1)" :style="getStyle(1)">热</button>
						</li>
						<li>
							<button @click="buttonClick(2)" :style="getStyle(2)">不另外加糖</button>
							<button @click="buttonClick(3)" :style="getStyle(3)">半糖</button>
							<button @click="buttonClick(4)" :style="getStyle(4)">标准糖</button>
						</li>
					</ul>
				</view>
			</view>
			<view class="intro">
				<view class="w">
					<p style="margin-bottom: 10px; padding-top: 10px">商品介绍</p>
					<image :src="item.src2"></image>
				</view>
			</view>
		</view>
		<view class="bottom">
			<view class="pic">
				<span style="color: black; font-size: 14px">单价：</span>
				￥{{ pic }}
			</view>
			<view class="count">
				<view @click="minus">
					<uni-icons type="minus" size="30"></uni-icons>
				</view>
				<view class="number">{{ num }}</view>
				<view @click="plus">
					<uni-icons type="plus-filled" size="30"></uni-icons>
				</view>
			</view>
			<button class="buy">立即购买</button>
			<button class="shopcar" @click="addShopcar">加入购物车</button>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			checkList: false,
			title: '',
			message: '',
			commodity: [],
			pic: '',
			src: '',
			activeButtonIndex: 2,
			num: 1
		};
	},

	onLoad: function (option) {
		//option为object类型，会序列化上个页面传递的参数

		this.message = decodeURIComponent(option.name);
		this.src = decodeURIComponent(option.src);
		this.reqCommodity();
	},
	methods: {
		minus() {
			if (this.num > 1) {
				this.num--;
			}
		},
		plus() {
			this.num++;
		},
		buttonClick(index) {
			this.activeButtonIndex = index;
		},
		getStyle(index) {
			if (index == this.activeButtonIndex) {
				return 'border: 1px solid #2979ff;';
			} else {
				return '';
			}
		},
		async addShopcar() {
			let username = uni.getStorageSync('userName');
			if (!username) {
				uni.showModal({
					title: '用户未登录',
					content: '是否前往登录',
					success: function (res) {
						if (res.confirm) {
							uni.navigateTo({
								url: '../login/login'
							});
						} else if (res.cancel) {
						}
					}
				});
			} else {
				let src = this.src;
				let pic = this.commodity[0].pic;
				let name = this.commodity[0].xqname;
				let num = this.num;
				var res = await this.$myRequest({
					url: '/detail',
					data: {
						src,
						pic,
						name,
						num
					},
					method: 'post'
				});
				uni.showToast({
					title: '商品已放入购物车',
					duration: 1000
				});
				setTimeout(() => {
					uni.reLaunch({
						url: '../menu/menu'
					});
				}, 500);
			}
		},
		favClick(index) {
			this.checkList = !this.checkList;
			this.$forceUpdate();
		},
		back() {
			uni.reLaunch({
				url: '../menu/menu'
			});
		},
		async reqCommodity() {
			var detailName = this.message;
			const res = await this.$myRequest({
				url: '/detail',
				data: { detailName }
			});

			this.commodity = res.data;
			this.title = res.data[0].xqname;
			this.pic = res.data[0].pic;
		}
	}
};
</script>

<style scoped lang="scss">
.count {
	position: absolute;
	right: 0;
	top: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 130px;
	height: 40px;
}
.option {
	width: 100%;
	height: 240px;
}

.pic {
	position: absolute;
	top: 10px;
	left: 30px;
	color: red;
	font-size: 20px;
}
.w {
	width: 90%;
	margin: 0 auto;
}
.body {
	background-color: #f5f5f5;
	width: 100%;
	// height: 100vh;
}
.back {
	position: fixed;
	width: 30px;
	height: 30px;
	border-radius: 15px;
	background-color: rgba(255, 247, 255, 0.2);
	font-size: 1px;
	top: 10px;
	left: 10px;
	z-index: 999;
}
.index button {
	position: absolute;
	width: 20px;
	height: 10px;
	top: 0;
	left: 0;
}
* {
	padding: 0;
	margin: 0;
}
.choose {
	float: right;
	width: 290px;
	height: 200px;
}
.choose ul {
	width: 290px;
	height: inherit;
	display: flex;
	flex-flow: row wrap;
	align-content: space-around;
}
.choose ul li {
	width: 290px;
	height: 30px;
	margin-left: 20px;
	list-style: none;
}
.choose ul li button {
	margin-left: 4px;
	font-size: 14px;
	float: left;
	line-height: 30px;
	width: 80px;
	height: 30px;
}
.describe ul {
	width: 80px;
	height: inherit;
	display: flex;
	flex-flow: row wrap;
	align-content: space-around;
}
.describe ul li {
	width: 80px;
	height: 30px;
	margin-left: 20px;
	list-style: none;
}
.describe {
	float: left;
	width: 80px;
	height: 200px;
}
.bottom {
	position: fixed;
	width: 100%;
	height: 90px;
	bottom: 0;
	background-color: #fff;
}
.bottom button {
	width: 160px;
	height: 40px;
	line-height: 40px;
	border-radius: 20px;
	margin-top: 50px;
}
.buy {
	float: left;
	margin-left: 14px;
	color: rgb(194, 163, 121);
	border: 1px solid rgb(194, 163, 121);
}
.shopcar {
	float: right;
	margin-right: 14px;
	background-color: rgb(0, 34, 171);
	color: #fff;
}

.index {
	position: relative;
	width: 100%;
}

.option {
	h3 {
		padding-left: 15px;
		padding-top: 10px;
		font-size: 20px;
		font-weight: normal;
	}
}
.intro {
	width: 95%;
	margin: 0 auto;
	background-color: #fff;
}
.intro .w image {
	width: 100%;
	height: 6170px;
	margin-bottom: 100px;
}
</style>
