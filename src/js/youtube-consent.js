/**
 * Two-click solution for YouTube videos: the player (and its connection to YouTube)
 * is only loaded after the user clicked the thumbnail.
 */
export default (() => {
  document.addEventListener('click', (event) => {
    const link = event.target.closest('a.youtube-consent[data-youtube-id]')
    if (link === null) {
      return
    }
    event.preventDefault()

    const params = new URLSearchParams({ autoplay: '1', rel: '0' })
    if (link.dataset.youtubeStart) {
      params.set('start', link.dataset.youtubeStart)
    }

    const iframe = document.createElement('iframe')
    iframe.className = 'youtube-player'
    iframe.src = 'https://www.youtube-nocookie.com/embed/' + encodeURIComponent(link.dataset.youtubeId) + '?' + params.toString()
    iframe.title = link.dataset.youtubeTitle || 'YouTube'
    iframe.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
    iframe.referrerPolicy = 'strict-origin-when-cross-origin'
    iframe.allowFullscreen = true

    link.replaceWith(iframe)
    iframe.focus()
  })
})()
