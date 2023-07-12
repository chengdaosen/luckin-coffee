<template>
<uni-shadow-root class="anduril-vantui-mp-overlay-index"><van-transition v-if="lockScroll" :show="show" custom-class="van-overlay" :custom-style="'z-index: '+(zIndex)+'; '+(customStyle)" :duration="duration" @click.native="onClick" @touchmove.native.stop.prevent="noop">
  <slot></slot>
</van-transition>
<van-transition v-else :show="show" custom-class="van-overlay" :custom-style="'z-index: '+(zIndex)+'; '+(customStyle)" :duration="duration" @click.native="onClick">
  <slot></slot>
</van-transition></uni-shadow-root>
</template>

<script>
import VanTransition from '../transition/index.vue'
global['__wxVueOptions'] = {components:{'van-transition': VanTransition}}

global['__wxRoute'] = 'anduril-vantui-mp/overlay/index'
import { VantComponent } from '../common/component';
VantComponent({
  props: {
    show: Boolean,
    customStyle: String,
    duration: {
      type: null,
      value: 300,
    },
    zIndex: {
      type: Number,
      value: 1,
    },
    lockScroll: {
      type: Boolean,
      value: true,
    },
  },
  methods: {
    onClick() {
      this.$emit('click');
    },
    // for prevent touchmove
    noop() {},
  },
});
export default global['__wxComponents']['anduril-vantui-mp/overlay/index']
</script>
<style platform="mp-weixin">
@import '../common/index.css';.van-overlay{position:fixed;top:0;left:0;width:100%;height:100%;background-color:rgba(0,0,0,.7);background-color:var(--overlay-background-color,rgba(0,0,0,.7))}
</style>