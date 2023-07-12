<template>
	<view :class="transition ? 'transition' : 'hide'">
		<image src="../../static/transition.jpg"></image>
	</view>
</template>

<script>
export default {
	data() {
		return {
			transition: true
		};
	},
	onLoad() {
		setTimeout(() => {
			this.transition = false; // 将过渡效果类名改为 'hide'，实现过渡页的淡出效果
			setTimeout(() => {
				uni.switchTab({
					url: '/pages/index/index' // 主页的路径
				});
			}, 50); // 等待 50ms，确保过渡效果完全消失后再跳转到主页
		}, 1000); // 淡出过渡效果前的等待时间
	}
};
</script>

<style>
image {
	width: 100%;
	height: 100vh;
}
.transition {
	opacity: 1;
	transition: opacity 1s ease-out;
}
.hide {
	opacity: 0;
}
</style>
