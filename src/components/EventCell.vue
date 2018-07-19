<template>
<div
  @click="toggle"
  class="eventcell"
  :class="{checked: checkedStatus}"
  :style="{left: width * 0.05 + 'px', width: width * 0.9 + 'px', top: (((start - startHour * 60) / 60) * (heightHour + 2)) + 'px', height: (((end - start) / 60) * (heightHour + 2))  + 'px' }"
  >
  <div :style="{transformOrigin: 'left top', transform: 'scale(' + width / 70.0 + ')', width: width * 0.9 * (70.0 / width) + 'px'}">{{toHhmm(start)}}-{{toHhmm(end)}}<br/>{{artist}}</div>
</div>
</template>

<script>
import Storage from '@/js/mystorage.js'
const storage = new Storage(localStorage, 'tif2018');

export default {
  name: 'EventCell',
  props: {
    name: {
      type: String
    },
    startHour: {
      type: Number,
      default: null
    },
    start: {
      type: Number,
      default: null
    },
    end: {
      type: Number,
      default: null
    },
    artist: {
      type: String,
      default: null
    },
    detail: {
      type: String,
      default: null
    },
    width: {
      type: Number,
      default: null
    },
    heightHour: {
      type: Number,
      default: 106
    }
  },
  computed: {
    eid() {
      return [this.name, this.start, this.end, this.artist].join("-");
    }
  },
  methods: {
    toHhmm(minValue) {
      const h = Math.floor(minValue / 60);
      const m = minValue % 60;
      return (h < 10 ? "0" + h : h) + "" + (m < 10 ? "0" + m : m);
    },
    toggle() {
      this.checkedStatus = !this.checkedStatus;
      storage.setItem(this.eid, this.checkedStatus);
    }
  },
  data() {
    return {
      checkedStatus: false
    }
  },
  created() {
    const savedStatus =  storage.getItem(this.eid);
    this.checkedStatus = savedStatus === null ? false : savedStatus;
  }
}
</script>

<style scoped>
div.eventcell.checked {
  background-color: yellow;
  font-weight: bold;
}
div.eventcell {
  position: absolute;
  overflow: hidden;
  background-color: #ffffff;
  padding: 1px;
  box-sizing: border-box;
  box-shadow: 0px 0.125em 0.25em rgba(0,0,0,.25);
  margin-top: 0;
  cursor: pointer;
  color: #000000;
  word-wrap: break-word;
  min-width: 0;
  min-height: 0;
  transition: all .4s;
  font-size: 10px;
  width: 9vw;
  line-height: 1;
}
</style>
