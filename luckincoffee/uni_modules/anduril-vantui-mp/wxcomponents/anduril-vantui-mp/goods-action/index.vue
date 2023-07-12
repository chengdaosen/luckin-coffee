<template>
<uni-shadow-root class="anduril-vantui-mp-goods-action-index"><view :class="'custom-class '+(utils.bem('goods-action', { safe: safeAreaInsetBottom }))">
  <slot></slot>
</view></uni-shadow-root>
</template>
<wxs src="../wxs/utils.wxs" module="utils"></wxs>
<script>

global['__wxRoute'] = 'anduril-vantui-mp/goods-action/index'
import { VantComponent } from '../common/component';
import { useChildren } from '../common/relation';
VantComponent({
  relation: useChildren('goods-action-button', function () {
    this.children.forEach((item) => {
      item.updateStyle();
    });
  }),
  props: {
    safeAreaInsetBottom: {
      type: Boolean,
      value: true,
    },
  },
});
export default global['__wxComponents']['anduril-vantui-mp/goods-action/index']
</script>
<style platform="mp-weixin">
@import '../common/index.css';.van-goods-action{position:fixed;right:0;bottom:0;left:0;display:flex;align-items:center;box-sizing:initial;height:50px;height:var(--goods-action-height,50px);background-color:#fff;background-color:var(--goods-action-background-color,#fff)}.van-goods-action--safe{padding-bottom:env(safe-area-inset-bottom)}
</style>