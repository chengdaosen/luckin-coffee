<template>
	<view>
		<view class="uni-margin-wrap">
			<swiper class="swiper" circular :indicator-dots="indicatorDots" :autoplay="autoplay" :interval="interval" :duration="duration">
				<swiper-item>
					<image src="../../static/banner/轮播图_图片2.png"></image>
				</swiper-item>
				<swiper-item>
					<image src="../../static/banner/轮播图_图片1.jpg"></image>
				</swiper-item>
			</swiper>
		</view>
		<view>
			<view class="aside">
				<ul v-for="(item, index) in classify" :key="item.id">
					<li :class="{ active: activeIndex == index }" @click="refresh" :data-type="item.type" :data-index="index">{{ item.type }}</li>
				</ul>
			</view>
			<view class="content">
				<p>
					{{ title }}
					<br />
					<span>瑞幸必喝爆款，无限回购</span>
				</p>
				<ul v-for="(item, index) in commodity" :key="item.id">
					<li @click="skipDetail" :data-name="item.cname" :data-src="item.src">
						<image :src="item.src"></image>
						<view class="name">{{ item.cname }}</view>
						<view class="intro">{{ item.ename }}</view>
						<view class="pic">{{ item.pic }}</view>
						<view class="add" :data-index="index">
							<uni-icons color="rgba(136, 175, 213, 1)" type="plus-filled" size="30"></uni-icons>
						</view>
					</li>
				</ul>
				<view class="end">我是有底线的~~</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			classify: [],
			commodity: [],
			indicatorDots: true,
			autoplay: true,
			interval: 2000,
			duration: 500,
			title: '人气TOP',
			activeIndex: 0 // 默认激活的项的索引
		};
	},
	// addCar() {
	// 	uni.switchTab({
	// 		url: '/pages/shopcar/shopcar'
	// 	});
	// },
	onLoad() {
		this.reqCommodity();
		this.reqType();
	},
	methods: {
		// changeBorderColor(index) {
		// 	this.activeIndex = index;
		// },
		async refresh(e) {
			this.activeIndex = e.currentTarget.dataset.index;
			var type = e.currentTarget.dataset.type;
			const res = await this.$myRequest({
				url: '/refresh',
				method: 'post',
				data: { type }
			});
			this.commodity = res.data;
			this.title = type;
			console.log(this.activeIndex);
			console.log(e.currentTarget.dataset.index);
		},

		async reqCommodity() {
			const res = await this.$myRequest({
				url: '/hot'
			});
			this.commodity = res.data;
		},
		async reqType() {
			const res = await this.$myRequest({
				url: '/classify'
			});
			this.classify = res.data;
		},
		skipDetail(e) {
			let name = e.currentTarget.dataset.name;
			let src = e.currentTarget.dataset.src;
			uni.navigateTo({
				url: '../detail/detail?name=' + encodeURIComponent(name) + '&src=' + encodeURIComponent(src)
			});
		}
	}
};
</script>

<style scoped>
.active {
	border-left: 3px solid #13aef6;
	font-weight: bold;
}
.end {
	font-size: 1px;
	padding-top: 10px;
	width: 100%;
	height: 100px;
	padding-left: 40px;
	/* 	margin-bottom: 100px; */
}
.content .add {
	position: absolute;
	bottom: 0;
	right: 0;
	width: 22px;
	height: 22px;
}
.content .add image {
	width: 22px;
	height: 22px;
}
.pic {
	position: absolute;
	bottom: 0;
	left: 84px;
	font-size: 15px;
}
.name {
	position: absolute;
	top: 5px;
	left: 84px;
	font-size: 15px;
}
.content .intro {
	position: absolute;
	top: 25px;
	left: 84px;
	width: 100px;
	height: 26px;
	font-size: 4px;
	font-weight: 300;
	line-height: 120%;
	color: rgba(166, 166, 166, 1);
}
.content ul {
	width: 255px;
}
.content ul li {
	position: relative;
	list-style: none;
	width: 255px;
	height: 74px;
	margin-bottom: 5px;
}
.content p {
	width: 100%;
	height: 50px;
	font-size: 13px;
	font-weight: bold;
}
.content p span {
	font-size: 2px;
	font-weight: 100;
}
.content image {
	position: absolute;
	top: 2px;
	left: 0;
	width: 70px;
	height: 70px;
}
.content {
	float: right;
	width: 270px;
}
* {
	padding: 0;
	margin: 0;
}
.aside {
	float: left;
	width: 90px;
}
.aside ul {
	width: 90px;
}
.aside ul li {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 90px;
	height: 44px;
	list-style: none;
	color: rgba(56, 56, 56, 1);
	background-color: rgba(248, 248, 248, 1);
	border-bottom: 1px solid #f6f4e1;
}

/* .aside ul li:nth-child(1) {
	font-weight: bold;
	border-left: 3px solid rgba(136, 175, 213, 1);
} */
image {
	width: 375px;
	height: 130px;
}
</style>
