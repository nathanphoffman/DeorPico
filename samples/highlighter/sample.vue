<!-- Vue sample -->
<template>
  <div class="card" :class="{ active: isActive }" @click.stop="toggle">
    <h2 v-if="title">{{ title.toUpperCase() }}</h2>
    <p>Don't worry &amp; count: {{ count }}</p>
    <li v-for="item in items" v-bind:key="item.id">{{ item.name }}</li>
    <TodoItem v-on:done="remove(item)" />
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

/* component definition */
export default defineComponent({
  name: "SampleCard",
  data() {
    return { count: 1_000, isActive: false as boolean };
  },
  methods: {
    toggle(): void {
      this.isActive = !this.isActive; // flip it
    },
  },
});
</script>
