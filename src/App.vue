<template>
  <div id="app">
    <el-tabs type="card">
      <el-tab-pane label="8/3(金)">
        <Timetable :width="windowWidth" name="day1" :schedules="day1"></Timetable>
      </el-tab-pane>
      <el-tab-pane label="8/4(土)">
        <Timetable :width="windowWidth" name="day2" :schedules="day2"></Timetable>
      </el-tab-pane>
      <el-tab-pane label="8/5(日)">
        <Timetable :width="windowWidth" name="day3" :schedules="day3"></Timetable>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import Vue from 'vue'
// ElementUI
import {Tabs, TabPane} from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/ja'


Vue.prototype.$ELEMENT = {size: 'small'};
Vue.use(Tabs)
Vue.use(TabPane)

import Timetable from '@/components/Timetable.vue'
import timetableData from '@/js/time.json'

export default {
  name: 'app',
  props: {
    stages: {
      type: Array,
      default: function () {
        return [
          {
            name: 'HOT STAGE',
            color: '#fb1a39'
          },
          {
            name: 'SMILE GARDEN',
            color: '#b1dd00'
          },
          {
            name: 'DREAM STAGE',
            color: '#009c45'
          },
          {
            name: 'DOLL FACTORY',
            color: '#ff84b4'
          },
          {
            name: 'SKY STAGE',
            color: '#39cdfe'
          },
          {
            name: 'FESTIVAL STAGE',
            color: '#ffdf33'
          },
          {
            name: 'FUJI YOKO STAGE',
            color: '#06708f'
          },
          {
            name: 'INFO CENTRE',
            color: '#fc3ca6'
          }
        ];
      }
    }
  },
  data() {
    return {
      windowWidth: window.innerWidth,
      timetableData: timetableData
    }
  },
  computed: {
    day1() {
      return this.convertTimetable(this.timetableData.day1);
    },
    day2() {
      return this.convertTimetable(this.timetableData.day2);
    },
    day3() {
      return this.convertTimetable(this.timetableData.day3);
    }
  },
  methods: {
    updateWindowSize(e) {
        this.windowWidth = document.documentElement.clientWidth;
    },
    convertTimetable(data) {
      var convertedData = [];
      for(var i = 0; i < this.stages.length; i++) {
        const stage = this.stages[i];
        const events = data[stage.name];
        var convertedEvents = [];
        for(var j = 0; j < events.length; j++) {
          const stInt = parseInt(events[j].start);
          const endInt = parseInt(events[j].end);
          convertedEvents.push(
            {
              start: ((stInt - stInt % 100) / 100) * 60 + (stInt % 100),
              end: ((endInt - endInt % 100) / 100) * 60 + (endInt % 100),
              artist: events[j].artist,
              detail: events[j].detail
            }
          );
        }
        convertedData.push({
          name: stage.name,
          color: stage.color,
          events: convertedEvents
        });
      }
      return convertedData;
    }
  },
  created() {
    window.addEventListener('resize', this.updateWindowSize, false);
  },
  destoryed() {
    window.removeEventListener('resze', this.updateWindowSize, false);
  },
  components: {
    Timetable
  }
}
</script>

<style>
body {
  margin: 0;
  font-family: "Hiragino Kaku Gothic ProN","メイリオ", sans-serif;
}
</style>
