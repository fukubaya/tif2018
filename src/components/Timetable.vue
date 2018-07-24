<template>
  <div class="container">
    <div class="header">
      <div v-for="stage in schedules" :style="{color: stage.color, flex: '0 0 ' + cellWidth + 'px'}">
        <div :style="{transformOrigin: 'left top', transform: 'scale(' + (cellWidth / 120.0) + ')', width: '120px'}">{{stage.name}}</div>
      </div>
    </div>
    <div class="main">
      <div class="main-timeline">
        <div v-for="hour in hourList" :style="{height: (heightHour / 2 - 3) + 'px', paddingTop: '3px'}">{{hour}}</div>
      </div>
      <div class="main-body">
        <div v-for="stage in schedules">
          <div class="task-placeholder">
              <EventCell
                v-for="event in stage.events"
                :name="name"
                :startHour="startHour"
                :start="event.start"
                :end="event.end"
                :artist="event.artist"
                :detail="event.detail"
                :width="cellWidth"
                :heightHour="heightHour"
                ></EventCell>
          </div>
          <div v-for="hour in hourList" class="placeholder-cell" :style="{backgroundColor: stage.color, width: cellWidth + 'px', height: heightHour / 2 + 'px'}"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import EventCell from '@/components/EventCell.vue'

export default {
  name: 'Timetable',
  props: {
    name: {
      type: String
    },
    startHour: {
      type: Number,
      default: 9
    },
    endHour: {
      type: Number,
      default: 21
    },
    width: {
      type: Number,
      default: window.innerWidth
    },
    schedules: {
      type: Array,
      default: function() {return [];}
    }
  },
  watch: {
    width(newVal) {
      this.allWidth = newVal;
    }
  },
  computed: {
    hourList() {
      var list = [];
      for(var i = this.startHour; i < this.endHour; i++){
        list.push(i);
        list.push("");
      }
      return list;
    },
    cellWidth() {
      return ((this.allWidth - 20) / this.schedules.length) - 2;
    },
    heightHour() {
      return this.cellWidth * 2;
    }
  },
  data() {
    return {
      allWidth: this.width
    }
  },
  components: {
    EventCell
  }
}
</script>

<style scoped>
.container * {
  box-sizing: content-box;
  font-family: sans-serif;
}
.el-tabs {
  font-family: sans-serif;
}
.header {
  border-left: 1px solid #e8e8e8;
  display: flex;
  padding-left: 24px;
  font-size: 10px;
  font-weight: bold;
}

.header > div {
  flex: 0 0 10vw;
  padding: 5px 0;
  background-color: #f0f0f0;
  border-left: 1px solid #e8e8e8;
  border-top: 1px solid #e8e8e8;
  text-align: center;
  overflow: hidden;
  word-wrap: break-word;
}
.main {
  display: flex;
}
.main-timeline {
  margin-top: -1px;
}
.main-timeline {
  border-top: 1px solid #e8e8e8;
}
.main-timeline div {
  background-color: #ff84b4;
  width: 20px;
  text-align: left;
  padding-left: 3px;
  color: #333333;
  border-right: 1px solid #e8e8e8;
  border-left: 1px solid #e8e8e8;
  font-size: 10px;
}
.main-timeline div:nth-child(even) {
  border-top: 1px dotted #e8e8e8;
  border-bottom: 1px solid #e8e8e8;
}
.main-body {
  display: flex;
}
.main-body > div > .task-placeholder {
  position: relative;
}
.main-body > div > .placeholder-cell {
  border-right: 1px solid #e8e8e8;
}
.main-body > div > div.placeholder-cell:nth-child(odd) {
  border-top: 1px dotted #e8e8e8;
  border-bottom: 1px solid #e8e8e8;
}
</style>

 
