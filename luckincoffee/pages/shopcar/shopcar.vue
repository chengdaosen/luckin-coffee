<template>
	<view>
		<view v-if="this.a" class="bodys">
			<view style="width: 100%; height: 120px; background-color: rgb(246, 246, 246)"></view>
			<view style="width: 90px; height: 60px; margin: 0 auto 0 auto">
				<image src="../../static/shopcar/none.png" style="width: 90px; height: 60px"></image>
			</view>
			<view style="margin: 20px auto; width: 117px; height: 19px; color: rgba(166, 166, 166, 1); font-size: 13px">您的购物车有点寂寞</view>
			<view style="width: 100px; height: 40px; margin: 10px auto" @click="drink">
				<button
					style="
						width: 100px;
						height: 30px;
						color: rgba(144, 192, 239, 1);
						background-color: rgba(255, 255, 255, 1);
						box-shadow: rgba(144, 192, 239, 1) solid 1px;
						border: 1px solid rgba(144, 192, 239, 1);
						border-radius: 4px;
						font-size: 14px;
						line-height: 30px;
						text-align: center;
					"
				>
					去喝一杯
				</button>
			</view>
		</view>
		<view v-else class="body">
			<image class="top" src="../../static/shopcar/图片_326.png" mode=""></image>
			<ul v-for="(item, index) in carList" :key="index">
				<li>
					<checkbox-group @change="checkboxChange" :data-index="index">
						<label>
							<checkbox style="margin-left: 8px" :checked="item.flag" />
						</label>
					</checkbox-group>
					<image class="img" :src="item.src"></image>
					<view class="title">
						{{ item.name }}
						<br />
						<span>单价:￥</span>
						{{ item.pic }}
					</view>
					<view class="num">
						<view :data-index="index" :data-name="item.name" @click="minus">
							<uni-icons type="minus" size="30"></uni-icons>
						</view>
						<view class="number">{{ item.num }}</view>
						<view :data-index="index" :data-name="item.name" @click="plus">
							<uni-icons type="plus-filled" size="30"></uni-icons>
						</view>
					</view>
				</li>
			</ul>
			<view>
				<checkbox-group @change="checkboxChanges" style="float: right">
					<label>
						全选
						<checkbox :checked="flag" />
					</label>
				</checkbox-group>
			</view>
			<view class="buy">
				<span>应付合计￥{{ sum }}</span>
				<button class="go" @click="toPay">去结算</button>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			flag: false,
			carList: [],
			a: false,
			sum: 0
		};
	},
	onLoad() {
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
						uni.reLaunch({
							url: '../menu/menu'
						});
					}
				}
			});
		} else {
			this.reqShopcar();
		}
	},
	methods: {
		toPay() {
			if (this.sum == 0) {
				uni.showToast({
					icon: 'error',
					title: '请勾选所需商品',
					duration: 1000
				});
			}
		},
		drink() {
			uni.reLaunch({
				url: '../menu/menu'
			});
		},
		async minus(e) {
			var index = e.currentTarget.dataset.index;
			this.carList[index].num = this.carList[index].num - 1;
			var splist = {
				spname: e.currentTarget.dataset.name,
				spnum: this.carList[index].num
			};
			var res = await this.$myRequest({
				url: '/car',
				data: {
					splist
				},
				method: 'post'
			});
			console.log(this.carList.length);
			if (res.data.length == 0) {
				console.log(this.a);
				this.flag = false;
				this.sum = 0;
				this.a = true;
			} else if (this.carList[index].num <= 0) {
				this.carList = res.data;
				console.log(1);
				//全选时删除其中一个商品，另外一个商品不打勾，全选打钩？
				this.flag = false;
				this.checkboxChanges();
			}
			this.total();
		},
		async plus(e) {
			var index = e.currentTarget.dataset.index;
			this.carList[index].num = this.carList[index].num + 1;
			var splist = {
				spname: e.currentTarget.dataset.name,
				spnum: this.carList[index].num
			};
			var res = await this.$myRequest({
				url: '/car',
				data: {
					splist
				},
				method: 'post'
			});
			this.total();
		},
		total() {
			var sums = 0;
			for (var i = 0; i <= this.carList.length; i++) {
				if (this.carList[i].flag) {
					sums += this.carList[i].num * this.carList[i].pic;
				}
				this.sum = sums;
			}
		},
		async reqShopcar() {
			var res = await this.$myRequest({
				url: '/car'
			});
			this.carList = res.data;
			this.carList.forEach((item, index) => {
				this.$set(item, 'flag', false);
			});
			if (this.carList.length == 0) {
				this.a = true;
			}
		},
		checkboxChange(e) {
			var index = e.currentTarget.dataset.index;
			this.carList[index].flag = !this.carList[index].flag;
			var a = 0;
			var sums = 0;
			for (var i = 0; i <= this.carList.length; i++) {
				if (this.carList[i].flag) {
					sums += this.carList[i].num * this.carList[i].pic;
					a++;
					if (a == this.carList.length) {
						this.flag = true;
					} else {
						this.flag = false;
					}
				}
				this.sum = sums;
			}
		},
		checkboxChanges() {
			this.flag = !this.flag;
			let sums = 0;
			if (this.flag) {
				for (var i = 0; i <= this.carList.length; i++) {
					this.carList[i].flag = true;
					sums += this.carList[i].num * this.carList[i].pic;
					this.sum = sums;
				}
			} else {
				for (var i = 0; i <= this.carList.length; i++) {
					this.carList[i].flag = false;
					this.sum = 0;
				}
			}
		}
	}
};
</script>

<style scoped>
.bodys {
	width: 100%;
	height: 100vh;
	background-color: rgb(246, 246, 246);
}
.buy {
	position: fixed;
	width: 100%;
	height: 50px;
	bottom: 50px;
	z-index: 999;
	background-color: #fff;
	line-height: 50px;
}
.buy span {
	float: left;
	margin-left: 30px;
}
.go {
	margin-top: 5px;
	margin-right: 10px;
	float: right;
	width: 100px;
	height: 40px;
	line-height: 40px;
	/* 	background-color: linear-gradient(90deg, #60f3ff, #088feb); */
	background-color: deepskyblue;
	color: #fff;
}
.example-body {
	padding: 0;
	/* #ifndef APP-NVUE */
	display: block;
	/* #endif */
}

.goods-carts {
	/* #ifndef APP-NVUE */
	display: flex;
	/* #endif */
	flex-direction: column;
	position: fixed;
	left: 0;
	right: 0;
	/* #ifdef H5 */
	left: var(--window-left);
	right: var(--window-right);
	/* #endif */
	bottom: 0;
}
.title {
	margin-left: 50px;
}
.num {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100px;
}
ul li .img {
	width: 76px;
	height: 76px;
}
* {
	margin: 0;
	padding: 0;
}
ul {
	width: 375px;
}
ul li {
	margin-bottom: 5px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	list-style: none;
	width: 375px;
	height: 80px;
	background-color: #ffffff;
	border-radius: 10px;
}

.body {
	width: 100%;
	height: 100vh;
	background-color: #f2f2f2;
}
.top {
	width: 100%;
	height: 67px;
}
</style>
